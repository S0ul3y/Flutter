import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/constants.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String? ID;
  String? nom = "";
  String? prenom = "";
  String? email = "";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      ID = currentUser.uid;

      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('Users').doc(ID).get();

      setState(() {
        nom = userDoc['nom'];
        prenom = userDoc['prenom'];
        email = userDoc['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sombre,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/images/afro.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 400,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nom :  ',
                          style: TextStyle(
                            color: vert,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          nom.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Prénom :  ',
                          style: TextStyle(
                            color: vert,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          prenom.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Email :  ',
                          style: TextStyle(
                            color: vert,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          email.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                child: MonButton(
                  vert,
                  'Déconnexion',
                  0,
                  20,
                  () {
                    FirebaseAuth.instance
                        .signOut(); // Déconnexion de l'utilisateur
                    Navigator.pushReplacementNamed(context, '/connexion');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
