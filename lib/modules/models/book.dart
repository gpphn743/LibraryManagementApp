class Book {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String thumbnail;
  DateTime? borrowDate;
  DateTime? returnDate;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnail,
    this.borrowDate,
    this.returnDate,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors: (json['volumeInfo']['authors'] ?? ['No Authors']).join(', '),
      description: json['volumeInfo']['description'] ?? 'No Description',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      borrowDate: json['borrowDate'] != null
          ? DateTime.parse(json['borrowDate'])
          : null,
      returnDate: json['returnDate'] != null
          ? DateTime.parse(json['returnDate'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'description': description,
      'thumbnail': thumbnail,
      'borrowDate': borrowDate?.toIso8601String(),
      'returnDate': returnDate?.toIso8601String(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? '',
      title: map['title'] ?? 'No Title',
      authors: map['authors'] ?? 'No Authors',
      description: map['description'] ?? 'No Description',
      thumbnail: map['thumbnail'] ?? '',
      borrowDate:
          map['borrowDate'] != null ? DateTime.parse(map['borrowDate']) : null,
      returnDate:
          map['returnDate'] != null ? DateTime.parse(map['returnDate']) : null,
    );
  }
}
