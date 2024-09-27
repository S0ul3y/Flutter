import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/AddTicket.dart';
import 'package:gest_tickets/Apprenant/Auth.dart';
import 'package:gest_tickets/Apprenant/CreerCompte.dart';
import 'package:gest_tickets/Apprenant/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gest_tickets/Apprenant/ticket.dart';
import 'package:gest_tickets/Formateur/AccueilFormateur.dart';
import 'package:gest_tickets/firspage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  );
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Auth(),

      // title: 'Navigation Demo',
      initialRoute: '/', // Route initiale (page d'accueil)
      routes: {
        // '/': (context) => Auth(), // Page d'accueil
        '/': (context) => const FirstPagState(), // Page d'accueil
        '/Accueil': (context) =>  HomeApprenant(),
        '/dashForm': (context) =>  dashform(),
        '/addticket': (context) =>  AddTicket(),
        '/creercompte': (context) => Compte(),
        '/ListeTicket': (context) => tichet(),
        '/connexion': (context) => Auth(),
        // '/connexion': (context) => Auth(),
      }
    );
  }
}
