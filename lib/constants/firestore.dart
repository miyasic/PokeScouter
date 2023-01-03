/// コレクション名
const kUserCollection = 'user';
const kPartyCollection = 'party';
const kBattleCollection = 'battle';

/// フィールド名
// user
const kFieldUserId = 'userId';
// party
const kFieldPartyId = 'partyId';
const kFieldPartyCreatedAt = 'createdAt';
// battle
const kFieldBattleId = 'battleId';
const kFieldBattleCreatedAt = 'createdAt';

/// enum
enum BattleResult {
  win,
  lose,
  draw,
  unknown;

  factory BattleResult.fromString(String input) {
    switch (input) {
      case "win":
        return BattleResult.win;
      case "lose":
        return BattleResult.lose;
      case "draw":
        return BattleResult.draw;
      default:
        return BattleResult.unknown;
    }
  }

  @override
  String toString() {
    switch (this) {
      case win:
        return "win";
      case lose:
        return "lose";
      case draw:
        return "draw";
      case unknown:
        return "unknown";
    }
  }
}
