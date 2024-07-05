class Book {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String thumbnail;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnail,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors: (json['volumeInfo']['authors'] ?? ['No Authors']).join(', '),
      description: json['volumeInfo']['description'] ?? 'No Description',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'description': description,
      'thumbnail': thumbnail,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? '',
      title: map['title'] ?? 'No Title',
      authors: map['authors'] ?? 'No Authors',
      description: map['description'] ?? 'No Description',
      thumbnail: map['thumbnail'] ?? '',
    );
  }
}
