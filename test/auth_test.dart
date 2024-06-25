import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_test.mocks.dart';  // Import the generated mocks

void main() {
  // Mock objects
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final BehaviorSubject<User?> _user = BehaviorSubject<User?>.seeded(null);

  // Mock the authStateChanges method to return the user stream
  when(_auth.authStateChanges()).thenAnswer((_) => _user.stream);

  // Test case
  // test('authStateChanges stream emits correct values', () async {
  //   // Listen to the authStateChanges stream
  //   final authStateStream = _auth.authStateChanges();
  //
  //   // Expect initial value to be null
  //   await expectLater(authStateStream, emitsInOrder([null]));
  //
  //   // Add a MockUser to the user stream
  //   final mockUser = MockUser();
  //   _user.add(mockUser);
  //
  //   // Expect the new value to be the mock user
  //   await expectLater(authStateStream, emitsInOrder([mockUser]));
  //
  //   // Add null to the user stream
  //   _user.add(null);
  //
  //   // Expect the value to be null again
  //   await expectLater(authStateStream, emitsInOrder([null]));
  // }

}
