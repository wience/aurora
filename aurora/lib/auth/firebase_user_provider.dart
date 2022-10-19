import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class AuroraFirebaseUser {
  AuroraFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AuroraFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AuroraFirebaseUser> auroraFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AuroraFirebaseUser>(
      (user) {
        currentUser = AuroraFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
