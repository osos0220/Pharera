import 'package:Pharera/cache_helper.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/features/user_auth/presentation/pages/login_page.dart';
import 'package:Pharera/features/user_auth/presentation/pages/sign_up_page.dart';
import 'features/user_auth/presentation/widgets/text_box.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetching the token and handling type conversion if necessary
    var tokenData = CacheHelper.getData(key: 'token');
    bool token = false;
    if (tokenData is String) {
      // Handle case where token is stored as a string
      token = tokenData.toLowerCase() == 'true';
    } else if (tokenData is bool) {
      token = tokenData;
    }

    final User? currentUser = FirebaseAuth.instance.currentUser;
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 174, 158, 130),
          title: Text(
            "Edit $field",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey[200]),
            ),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context, newValue),
            ),
          ],
        ),
      );

      if (newValue.trim().isNotEmpty && currentUser != null) {
        try {
          await usersCollection.doc(currentUser.uid).update({field: newValue});
        } catch (e) {
          print('Error updating $field: $e');
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: ConditionalBuilder(
        condition: token,
        builder: (context) {
          if (currentUser == null) {
            return const Center(child: Text('No user is currently logged in.'));
          }
          return StreamBuilder<DocumentSnapshot>(
            stream: usersCollection.doc(currentUser.uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final userData = snapshot.data!.data() as Map<String, dynamic>?;
                if (userData == null) {
                  return const Center(child: Text('No user data found.'));
                }
                return ListView(
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.person,
                      size: 72,
                      color: Color.fromARGB(255, 174, 158, 130),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentUser.email ?? 'No email available',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color.fromARGB(255, 174, 158, 130)),
                    ),
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        'My Details',
                        style: TextStyle(color: Color.fromARGB(255, 174, 158, 130)),
                      ),
                    ),
                    MyTextBox(
                      text: "${userData["username"]}",
                      sectionName: 'UserName',
                      onPressed: () => editField('username'),
                    ),
                    MyTextBox(
                      text: "${userData["email"]}",
                      sectionName: 'Email',
                      onPressed: () => editField('email'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
        fallback: (context) => SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Image.asset("assets/images/pl.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      width: 280,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFCCAE6B),
                            Color(0xFFD5B975),
                            Color(0xFFD4B97C),
                            Color(0xFFE0C586),
                            Color(0xFFEED392),
                            Color(0xFFE8CD8C),
                            Color(0xFFDABF80),
                            Color(0xFFCBB073),
                            Color(0xFFBBA267),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).signin,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: Container(
                      width: 280,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFCCAE6B),
                            Color(0xFFD5B975),
                            Color(0xFFD4B97C),
                            Color(0xFFE0C586),
                            Color(0xFFEED392),
                            Color(0xFFE8CD8C),
                            Color(0xFFDABF80),
                            Color(0xFFCBB073),
                            Color(0xFFBBA267),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).signup,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
