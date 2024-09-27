import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/Accueil.dart';
import 'package:gest_tickets/Formateur/AccueilFormateur.dart';
import 'package:gest_tickets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Utilisateur {
//   final String userId;
//   final String nomUser;
//   final String prenomUser;
//   final String emailUser;
//   final String roleUser;

//   Utilisateur({
//     required this.userId,
//     required this.nomUser,
//     required this.prenomUser,
//     required this.emailUser,
//     required this.roleUser,
//     });
// }

class Auth extends StatefulWidget {
  const Auth({super.key});

  // const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // String? UserId;
  // Utilisateur? UserCourant;

  @override
  Widget build(BuildContext context) {
    
    final EmailContro = TextEditingController();
    final PassContro = TextEditingController();

    void signInUser() async {
      // String email = EmailContro.text;
      // String password = PassContro.text;

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailContro.text,
          password: PassContro.text,
        );

        // UserId = userCredential.user!.uid;
        // Récupération du rôle de l'utilisateur depuis Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .get();
        // String nomU = userDoc['nom'];
        // String prenomU = userDoc['prenom'];
        // String emailU = userDoc['email'];
        String roleU = userDoc['role'];

        // UserCourant = Utilisateur(userId: UserId.toString(), nomUser: nomU, prenomUser: prenomU, emailUser: emailU, roleUser: roleU);

        // Redirection en fonction du rôle
        if (roleU == 'Apprenant') {
          Navigator.pushReplacementNamed(context, '/Accueil');
        } else if (roleU == 'Formateur') {
          Navigator.pushReplacementNamed(context, '/dashForm');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => dashform()),
          // );
        } else if (roleU == 'Admin') {
          Navigator.pushReplacementNamed(context, '/gestionnairePage');
        }
      } catch (e) {
        print("Error: $e");
      }
    }

    return Scaffold(
      backgroundColor: sombre,
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: Column(
                children: [
                  // BackBTN(() {
                  //   print('object');
                  //   return null;
                  // }),

                  // const Text('.'),

                  SizedBox(
                      width: 350,
                      height: 350,
                      child: Image.asset(
                        'lib/images/Auth.png',
                        fit: BoxFit.contain,
                      )),

                  // SizedBox(height: 5),

                  const Text(
                    'Connexion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.bold),
                  ),

                  MonInput(
                    color: Colors.white,
                    text: 'Email',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: EmailContro,
                    obscruretext: false,
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'password',
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: vert,
                      size: 30,
                    ),
                    controller: PassContro,
                    obscruretext: true,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  MonButton(vert, 'Se connecter', 30, 20, () {
                    signInUser();
                    return null;
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
