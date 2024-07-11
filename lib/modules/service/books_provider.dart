import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/firestore_service.dart';
import 'package:library_management_app/modules/service/google_books_service.dart';
import 'package:library_management_app/modules/models/book.dart';

class BooksProvider extends ChangeNotifier {
  final ApiService apiService;
  final FirestoreService firestoreService = FirestoreService();
  List<Book> books = []; //for searching
  List<Book> trendingBooks = [];
  List<Book> bucketListBooks = [];
  // List<Book> onBorrowingBooks = []; //already have borrowedBooks
  List<Book> borrowedBooks = [];
  bool isLoading = false;

  BooksProvider({required this.apiService}) {
    fetchDisplayBooks();
    fetchBorrowedBooks();
  }

  Future<void> fetchBooks(String query) async {
    isLoading = true;
    notifyListeners();

    try {
      final results = await apiService.fetchBooks(query);
      books = results.map((json) => Book.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDisplayBooks() async {
    isLoading = true;
    notifyListeners();

    try {
      trendingBooks = (await apiService.fetchBooks('wall street'))
          .map((json) => Book.fromJson(json))
          .toList();
      bucketListBooks = (await apiService.fetchBooks('flow'))
          .map((json) => Book.fromJson(json))
          .toList();
      // onBorrowingBooks = (await apiService.fetchBooks('flow'))
      //     .map((json) => Book.fromJson(json))
      //     .toList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addToBorrowedBooks(Book book, DateTime returnDate) async {
    book.borrowDate = DateTime.now();
    book.returnDate = returnDate;

    if (!borrowedBooks.any((b) => b.id == book.id)) {
      await firestoreService.addBorrowedBook(book);
      borrowedBooks.add(book);
      notifyListeners();
    } else {
      debugPrint('Book is already borrowed!');
    }
  }

  Future<void> fetchBorrowedBooks() async {
    borrowedBooks = await firestoreService.getBorrowedBooks();
    notifyListeners();
  }

  Future<void> deleteBorrowedBooks(String bookId) async {
    await firestoreService.deleteBorrowedBook(bookId);
    borrowedBooks.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }
}
