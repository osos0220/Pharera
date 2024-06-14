import 'package:Pharera/features/user_auth/presentation/widgets/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../global/common/toast.dart';
import '../../../../navigation_bar.dart';
import '../widgets/drawer_widget.dart';
import 'login_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection("users");

  Future<void> editField(String field) async {
    // Implementation remains the same as before
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
      );
      showToast(message: "Successfully signed out");
    } catch (e) {
      print("Error signing out: $e");
      showToast(message: "Failed to sign out");
    }
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()), // Navigate to MyHomePage
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 174, 158, 130),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _navigateToHomePage(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userData = snapshot.data!.data() as Map?;
                  return Column(
                    children: [
                      const SizedBox(height: 50),
                      const Icon(
                        Icons.person,
                        size: 72,
                        color: Color.fromARGB(255, 174, 158, 130),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currentUser?.email ?? 'No email available',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 174, 158, 130),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.only(right: 240.0),
                        child: Text(
                          'My Details',
                          style: TextStyle(
                              color: Color.fromARGB(255, 174, 158, 130)),
                        ),
                      ),
                      MyTextBox(
                        text: "${userData?["username"]}",
                        sectionName: 'UserName',
                        onPressed: () => editField('username'),
                      ),
                      MyTextBox(
                        text: "${userData?["email"]}",
                        sectionName: 'Email',
                        onPressed: () => editField('email'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // Sign out button at the bottom of the screen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    color: Colors.black87,
                    onPressed: () => signOut(context),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => signOut(context),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Color.fromARGB(255, 174, 158, 130),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}