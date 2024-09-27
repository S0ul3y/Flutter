import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import package:date_formatter/date_formatter.dart;
// import 'package:date_format/date_format.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  // const Auth({super.key});

  @override
  State<AddTicket> createState() => AddTicketState();
}

class AddTicketState extends State<AddTicket> {
  String? _selectedValue;
  String? ID;
  //  DateTime today = new DateUtils;
  //  final today = DateTime.now().day;
  final today = DateTime.now();
  // String formattedDate = DateFormatter.formatDateTime(
  //   dateTime: DateTime.now(),
  //   outputFormat: 'dd/MM/yyyy',
  // );
  

  final TextEditingController Titre = TextEditingController();
  final TextEditingController Cathegorie = TextEditingController();
  final TextEditingController Description = TextEditingController();
  // final TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void AddTicket() async {
      String titre = Titre.text;
      String description = Description.text;
      // String email = Email.text;
      // String password = Password.text;
      String cathegorie = _selectedValue.toString();

      // AjouterTicket(titre, description, cathegorie);

      try {
        User? currentUser = FirebaseAuth.instance.currentUser;

        // User? user = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          ID = currentUser.uid;
        }
        // String UserId = user.uid;
        await FirebaseFirestore.instance.collection('Ticket').add({
          'userid': ID,
          'titre': titre,
          'description': description,
          'cathegorie': cathegorie,
          'date': today.toString(),
          'reponse': 'En cours de traitement ...',
          // 'email': email,
        });
        Navigator.pushReplacementNamed(context, '/ListeTicket');
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
                  BackBTN(
                    () {
                    Navigator.pop(context);
                    return null;
                    // print('object: ');
                    }),
                  const Text('.'),
                  SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        'lib/images/Auth.png',
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(height: 5),
                  const Text(
                    'Ajouter un ticket',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'Titre',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Titre,
                    obscruretext: false,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedValue,
                    hint: const Text('Sélectionnez une categorie'),
                    items: <String>['Pratique', 'Théorique', 'Technique']
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
                      hintText: "Bonjour",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'Description',
                    icon: const Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: Description,
                    obscruretext: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MonButton(vert, 'Ajouter', 30, 20, () {
                    AddTicket();
                    return null;
                    // print(today.toString());
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
