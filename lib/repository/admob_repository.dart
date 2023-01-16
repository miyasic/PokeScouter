import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/providers/admob_id_provider.dart';
import 'package:poke_scouter/util/logger.dart';

final admobRepositoryProvider = Provider<AdmobRepository>(
    (ref) => AdmobRepository(ref.read(admobId))..load());

class AdmobRepository {
  AdmobRepository(this.id);

  final String id;
  bool hasShown = false;
  RewardedAd? ad;

  // 広告取得
  Future load() async {
    await RewardedAd.load(
      adUnitId: id,
      request: const AdRequest(),
      rewardedAdLoadCallback:
          RewardedAdLoadCallback(onAdLoaded: (rewardAd) async {
        logger.d("広告取得成功");
        rewardAd.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedAd ad) async {
          logger.d("広告の再生が終了しました。");
          logger.d("広告を破棄します。");
          await ad.dispose();
        }, onAdFailedToShowFullScreenContent: (Ad ad, AdError error) async {
          logger.d("広告の再生に失敗しました。");
          logger.d("広告を破棄します。");
          await ad.dispose();
        });
        ad = rewardAd;
      }, onAdFailedToLoad: (loadAdError) {
        logger.d("広告取得失敗");
      }),
    );
  }

  // 広告表示
  Future showAd(VoidCallback callback) async {
    if (ad == null) {
      logger.d("広告が存在しません。");
      return;
    }
    await ad!.show(
        onUserEarnedReward: (AdWithoutView adWithoutView, RewardItem reward) {
      hasShown = true;
      callback();
    });
  }
}
