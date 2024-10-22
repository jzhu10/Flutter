import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hw3/models/book.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

enum SortType { title, author }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<Book> bookList;
  late SortType sortType;

  HomeBloc() : super(BookList()) {
    on<BookListEvent>((event, emit) {
      emit(BookList());
    });

    on<SortByTitleEvent>((event, emit) async {
      await emitBookListWithLoading(emit, SortType.title);
    });

    on<SortByAuthorEvent>((event, emit) async {
      await emitBookListWithLoading(emit, SortType.author);
    });

    on<BookDetailsEvent>((event, emit) async {
      emit(BookDetails(id: event.id));
    });
  }

  // Fill in the books
  // Initial order: Sort by author
  void init() {
    bookList = List.generate(6, (index) => Book.createMockBook(index));
    sortBooksByType(SortType.author);
  }

  void sortBooksByType(SortType sortType) {
    stringFieldExtractor(Book book) =>
        sortType == SortType.author ? book.author : book.title;

    bookList.sort(
        (a, b) => stringFieldExtractor(a).compareTo(stringFieldExtractor(b)));
    this.sortType = sortType;
  }

  Future<void> emitBookListWithLoading(
      Emitter<HomeState> emit, SortType sortType) async {
    emit(Loading());
    sortBooksByType(sortType);
    await Future.delayed(const Duration(milliseconds: 500));
    emit(BookList());
  }
}
