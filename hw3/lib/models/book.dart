import 'package:hw3/services/mock.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  static Book createMockBook(int index) {
    return Book(
      id: index,
      title: Mock.title(),
      author: Mock.author(),
      description: Mock.description(),
      imageUrl: Mock.imageUrl(),
    );
  }

  @override
  String toString() {
    return 'User(id: $id, title: $title, author: $author, description: $description, imageUrl: $imageUrl) \n';
  }
}
