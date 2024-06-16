import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/google_books_service.dart';
import 'package:library_management_app/modules/models/book.dart';

class BooksProvider extends ChangeNotifier {
  final ApiService apiService;
  List<Book> books = [];
  bool isLoading = false;

  BooksProvider({required this.apiService});

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
}
