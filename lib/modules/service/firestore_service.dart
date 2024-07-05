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
}
