part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class BookList extends HomeState {}

final class Loading extends HomeState {}

final class BookDetails extends HomeState {
  final int id;
  BookDetails({required this.id});
}
