class DiceEngine {
  static int hits(int attacks, double chance) =>
      (attacks * chance).round();

  static int wounds(int hits, double chance) =>
      (hits * chance).round();
}
