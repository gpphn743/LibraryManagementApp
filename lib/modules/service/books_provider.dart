import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/google_books_service.dart';
import 'package:library_management_app/modules/models/book.dart';

class BooksProvider extends ChangeNotifier {
  final ApiService apiService;
  List<Book> books = [];
  List<Book> trendingBooks = [];
  List<Book> bucketListBooks = [];
  List<Book> onBorrowingBooks = [];
  List<Book> borrowedBooks = [];
  bool isLoading = false;

  BooksProvider({required this.apiService}) {
    fetchAllBooks();
  }

  Future<void> fetchBooks(String query) async {
    isLoading = true;
    notifyListeners();

    try {
      final results = await apiService.fetchBooks(query);
      books = results.map((json) => Book.fromJson(json)).toList();
    } catch (e) {
      // Handle the error appropriately
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllBooks() async {
    isLoading = true;
    notifyListeners();

    try {
      trendingBooks = (await apiService
              .fetchBooks('lord of the rings')) // Adjust query as needed
          .map((json) => Book.fromJson(json))
          .toList();
      bucketListBooks = (await apiService
              .fetchBooks('little women')) // Adjust query as needed
          .map((json) => Book.fromJson(json))
          .toList();
      onBorrowingBooks =
          (await apiService.fetchBooks('wall street')) // Adjust query as needed
              .map((json) => Book.fromJson(json))
              .toList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addToBorrowedBooks(Book book) {
    borrowedBooks.add(book);
    notifyListeners();
  }
}
