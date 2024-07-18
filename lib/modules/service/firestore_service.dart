import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_app/modules/models/book.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBorrowedBook(Book book) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('borrowedBooks')
          .doc(book.id)
          .set(book.toMap());
    }
  }

  Future<List<Book>> getBorrowedBooks() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('borrowedBooks')
          .get();
      return querySnapshot.docs
          .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> deleteBorrowedBook(String bookId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('borrowedBooks')
          .doc(bookId)
          .delete();
    }
  }

  Future<void> setUserInfo(String username) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'username': username,
      }, SetOptions(merge: true));
    }
  }

  Future<String?> getUserInfo() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      return userDoc['username'] as String?;
    }
    return null;
  }

  Future<void> addFavoriteBook(Book book) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favoriteBooks')
          .doc(book.id)
          .set(book.toMap());
    }
  }

  Future<void> removeFavoriteBook(String bookId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favoriteBooks')
          .doc(bookId)
          .delete();
    }
  }

  Future<List<Book>> getFavoriteBooks() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favoriteBooks')
          .get();
      return querySnapshot.docs
          .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
