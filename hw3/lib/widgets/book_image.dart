import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;
  const BookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
