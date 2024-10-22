import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/models/book.dart';
import 'package:hw3/pages/home/bloc/home_bloc.dart';
import 'package:hw3/widgets/book_image.dart';

class BookInfo extends StatelessWidget {
  final int id;
  const BookInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    Book book = bloc.bookList[id];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BookCover
          SizedBox(width: 250, child: BookImage(imageUrl: book.imageUrl)),
          const SizedBox(height: 8),

          // BookContent
          PaddingText(
            text: book.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          PaddingText(
            text: book.author,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          PaddingText(
            text: book.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class PaddingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const PaddingText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: style),
    );
  }
}
