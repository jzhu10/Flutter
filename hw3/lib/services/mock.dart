import 'package:flutter_lorem/flutter_lorem.dart';
import 'dart:math' as math;

const List<String> colors = [
  "salmon",
  "coral",
  "orange",
  "goldenrod",
  "seagreen",
  "darkcyan",
  "royalblue",
  "darkmagenta",
  "palevioletred",
  "peru",
  "rosybrown",
  "teal"
];

class Mock {
  static String title() {
    return lorem(paragraphs: 1, words: 3)
        .replaceAll(".", "")
        .replaceAll(",", "");
  }

  static String author() {
    return lorem(paragraphs: 1, words: 2)
        .replaceAll(".", "")
        .replaceAll(",", "");
  }

  static String description() {
    return lorem(paragraphs: 1, words: 200);
  }

  static String imageUrl() {
    String color = colors[math.Random().nextInt(colors.length)];
    return 'https://placehold.co/300x480/$color/$color.png';
  }
}
