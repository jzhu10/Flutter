import 'package:flutter/material.dart';
import 'package:hw3/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/pages/home/views/book_details_view.dart';
import 'package:hw3/pages/home/views/book_list_view.dart';
import 'package:hw3/pages/home/views/loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc()..init(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          switch (state) {
            case Loading _:
              return const LoadingView();
            case BookDetails _:
              return BookDetailsView(id: state.id);
            case BookList _:
            default:
              return const BookListView();
          }
        }));
  }
}
