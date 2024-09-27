import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
  
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  // const Auth({super.key});
  
   
  @override
  State<Compte> createState() => CompteState();
}

class CompteState extends State<Compte> {
  String? _selectedValue ;
    // String role_=_selectedValue.toString();
  
  final TextEditingController Nom = TextEditingController();
  final TextEditingController Prenom = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    

    // final TextEditingController roleController = TextEditingController();

    Future<void> signUp(String nom, String prenom, String email, String password, String? role) async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Storing additional user info in Firestore
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set({
            'nom': nom,
            'prenom': prenom,
            'role': role,
            'email': email,
        });
      } catch (e) {
        print("Error: $e");
      }
    }

    void signUpUser() {
      String nom = Nom.text;
      String prenom = Prenom.text;
      String email = Email.text;
      String password = Password.text;
      String role = _selectedValue.toString() ;

      signUp(nom, prenom, email, password, role);
      Navigator.pop(context);
    }






    return Scaffold(
      backgroundColor: sombre,
      body: ListView(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: BackBTN(() {
                Navigator.pop(context);
                // return null;
                // print('object');
              }),
            ),
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: Column(
                children: [
                 
                  // const Text('.'),

                  const Text(
                    'Créer un compte',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  MonInput(
                    color: Colors.white,
                    text: 'Nom',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Nom,
                    obscruretext: false,
                  ),
                  SizedBox(height: 15,),
                  MonInput(
                    color: Colors.white,
                    text: 'Prenom',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Prenom,
                    obscruretext: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'Email',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Email,
                    obscruretext: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'Mot de passe',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Password,
                    obscruretext: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // MonInput(
                  //   color: Colors.white,
                  //   text: 'Role',
                  //   icon: Icon(
                  //     Icons.remove_red_eye,
                  //     color: vert,
                  //     size: 30,
                  //   ),
                  //   controller: PassContro,
                  //   obscruretext: true,
                  // ),


                  

                 DropdownButtonFormField<String>(
                    value: _selectedValue,
                    hint: const Text('Sélectionnez une option'),
                    items: <String>['Admin', 'Formateur', 'Apprenant']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      // prefixIcon: icon,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: vert),
                      ),
                      hintText: "verrever",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),









                  const SizedBox(
                    height: 15,
                  ),
                  MonButton(vert,'Enregistrer', 30, 20, () {
                    signUpUser();
                    
                    // print(_selectedValue);
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
