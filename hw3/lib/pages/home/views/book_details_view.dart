import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/pages/home/bloc/home_bloc.dart';
import 'package:hw3/widgets/book_info.dart';

class BookDetailsView extends StatelessWidget {
  final int id;
  const BookDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Detail"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            bloc.add(BookListEvent());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BookInfo(id: id),
      ),
    );
  }
}
