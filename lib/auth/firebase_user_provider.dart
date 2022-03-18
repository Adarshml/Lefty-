import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LeftyFirebaseUser {
  LeftyFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

LeftyFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LeftyFirebaseUser> leftyFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<LeftyFirebaseUser>((user) => currentUser = LeftyFirebaseUser(user));
