import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/models/book.dart';
import 'package:hw3/pages/home/bloc/home_bloc.dart';
import 'package:hw3/styles/limited_text.dart';
import 'package:hw3/styles/styled_outlined_button.dart';
import 'package:hw3/widgets/book_image.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Club Home"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SortSelector(),
          SortedBookList(),
        ],
      ),
    );
  }
}

class SortSelector extends StatelessWidget {
  const SortSelector({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text("Sort by", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 10),
          StyledOutlinedButton(
            onPressed: () {
              bloc.add(SortByAuthorEvent());
            },
            text: 'Author',
            isSelected: bloc.sortType == SortType.author,
          ),
          const SizedBox(width: 10),
          StyledOutlinedButton(
            onPressed: () {
              bloc.add(SortByTitleEvent());
            },
            text: 'Title',
            isSelected: bloc.sortType == SortType.title,
          ),
        ],
      ),
    );
  }
}

class SortedBookList extends StatelessWidget {
  const SortedBookList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child:
              Text("Books", style: Theme.of(context).textTheme.headlineMedium),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bloc.bookList.length,
            itemBuilder: (BuildContext context, int index) {
              Book book = bloc.bookList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: index == bloc.bookList.length - 1 ? 20 : 0,
                ),
                child: GestureDetector(
                  onTap: () {
                    bloc.add(BookDetailsEvent(id: index));
                  },

                  // Book cover
                  // Add content(author & title) to the cover for easier
                  // identify the sorted result.
                  child: Stack(alignment: Alignment.center, children: [
                    BookImage(imageUrl: book.imageUrl),
                    BookCoverContent(index: index),
                  ]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class BookCoverContent extends StatelessWidget {
  final int index;
  const BookCoverContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Book book = BlocProvider.of<HomeBloc>(context).bookList[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const StyledTitle(text: "Author"),
          StyledContent(text: book.author),
          const SizedBox(height: 30),
          const StyledTitle(text: "Title"),
          StyledContent(text: book.title),
        ],
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  final String text;
  const StyledTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: Colors.white70),
    );
  }
}

class StyledContent extends StatelessWidget {
  final String text;
  const StyledContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LimitedText(
      text: text,
      count: 5,
      style:
          Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
    );
  }
}
