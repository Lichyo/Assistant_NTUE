import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assistant/models/account/account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccountApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  UserAccountApi() {
    _setAccount();
  }

  bool isUserLogin() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _setAccount() async {
    final users = await _firestore.collection('user').get();
    for (var user in users.docs) {
      if (user.get('email') == _auth.currentUser?.email) {
        Account.instance = Account(
            password: user.get('password'),
            userName: user.get('userName'),
            email: user.get('email'),
            ID: user.get('ID'));
        break;
      }
    }
  }

  Future<void> login({required email, required password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setAccount();
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<void> logout() async => _auth.signOut();
}
