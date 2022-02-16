class Cafe {
  late String label;
  late String imageUrl;

  static List<Cafe> samples = [
    Cafe(
      'Yellow Sub-marine',
      'assets/home.png',
    ),
  ];
  Cafe(Comparable<String> s, String t);
}