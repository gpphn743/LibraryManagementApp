// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:library_management_app/modules/models/book.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<void> addBorrowedBook(String userId, Book book) async {
//     try {
//       await _db
//           .collection('users')
//           .doc(userId)
//           .collection('borrowedBooks')
//           .doc(book.id)
//           .set({
//         'title': book.title,
//         'author': book.authors,
//         'thumbnail': book.thumbnail,
//         'borrowedDate': Timestamp.now(),
//         'returnDate': null, //add later, maybe 30 days/borrow
//       });
//     } catch (e) {
//       debugPrint('Error adding borrowed book: $e');
//     }
//   }

//   Stream<List<Book>> getBorrowedBooks(String userId) {
//     return _db.collection('users')
//       .doc(userId)
//       .collection('borrowedBooks');
//   }
// }
