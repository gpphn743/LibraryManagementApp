class Book {
  final String title;
  final String authors;
  final String description;
  final String thumbnail;

  Book({
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnail,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors: (json['volumeInfo']['authors'] ?? ['No Authors']).join(', '),
      description: json['volumeInfo']['description'] ?? 'No Description',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
    );
  }
}
