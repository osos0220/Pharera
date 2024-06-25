import 'package:firebase_auth/firebase_auth.dart';

bool isUserSignedIn() {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    return true;
  }
  else {
    return false;
  }
}