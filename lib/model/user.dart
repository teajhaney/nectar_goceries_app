import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String password;
  final String userName;

  const User({
    required this.userName,
    required this.email,
    required this.password,
    required this.uid,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        userName: snapshot['userName'],
        email: snapshot['email'],
        password: snapshot['password'],
        uid: snapshot['uid']);
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
        "uid": uid,
      };
}
