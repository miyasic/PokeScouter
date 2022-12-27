import 'package:flutter_template/providers/admob_id_provider.dart';
import 'package:flutter_template/util/logger.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final admobRepositoryProvider =
    Provider<AdmobRepository>((ref) => AdmobRepository(ref.read(admobId)));

class AdmobRepository {
  AdmobRepository(this.id);
  final String id;
  Future load() async {
    await RewardedAd.load(
      adUnitId: id,
      request: AdRequest(),
      rewardedAdLoadCallback:
          RewardedAdLoadCallback(onAdLoaded: (interstitial) {
        print("広告取得成功");
        interstitial.show(onUserEarnedReward: (ad, reward) {
          print("動画を見ました。");
        });
      }, onAdFailedToLoad: (interstitial) {
        print("広告取得失敗");
      }),
    );
    // await RewardedInterstitialAd.load(
    //   adUnitId: id,
    //   request: AdRequest(),
    //   rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
    //       onAdLoaded: _onAdLoaded, onAdFailedToLoad: _onAdFailedToLoad),
    // );
  }

  // 広告取得に失敗した時のコールバック
  FullScreenAdLoadErrorCallback _onAdFailedToLoad(LoadAdError error) {
    return (LoadAdError error) {
      logger.d("広告取得失敗");
    };
  }

  // 広告取得に成功した時のコールバック
  GenericAdEventCallback<RewardedInterstitialAd> _onAdLoaded(
      RewardedInterstitialAd interstitialAd) {
    return (RewardedInterstitialAd interstitialAd) {
      logger.d("広告取得成功");
      interstitialAd.show(onUserEarnedReward: _onUserEarnedRewardCallback);
    };
  }

  // 広告動画を見終わった後のコールバック
  OnUserEarnedRewardCallback _onUserEarnedRewardCallback(
      AdWithoutView ad, RewardItem reward) {
    return (AdWithoutView ad, RewardItem reward) {
      logger.d("動画を見ました。");
    };
  }
}
