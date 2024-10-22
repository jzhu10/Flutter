part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class BookListEvent extends HomeEvent {}

class SortByTitleEvent extends HomeEvent {}

class SortByAuthorEvent extends HomeEvent {}

class BookDetailsEvent extends HomeEvent {
  final int id;
  BookDetailsEvent({required this.id});
}
