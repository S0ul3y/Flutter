import 'package:flutter/material.dart';
import 'package:gest_tickets/constants.dart';

class tichet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sombre,
      body: Column(
        children: [
          topBar(
              Image.asset(
                'lib/images/logo.png',
                width: 70,
                height: 70,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: sombre,
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search,
                    color: Colors.white), // Ajouter l'icône de recherche ici
              ),
              style: TextStyle(color: Colors.white), // Couleur du texte saisi
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 15,
          ),
          trier(
              TrierButton('lib/images/pc.png', 'Pratique', trivert, () {}),
              TrierButton(
                  'lib/images/technique.png', 'Théorique', tribleu, () {}),
              TrierButton(
                  'lib/images/theorique.png', 'Technique', tricafe, () {})),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('.'),
                MonButton('Ajouter un ticket', 15, 10, () {
                  print("object");
                })
              ],
              // child:
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [Column()],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              MonTicket('Category', 'titre', 'Date', () {
                print("object");
              }),
              MonTicket('Category', 'titre jfehfbebhbebfhsdvcdsvdvgdfqgdvqdbhvbdhvbhdd sq vvrgqcdvdsvdfvdqsvgdgvq', 'Date', () {
                print("object");
              }),
              MonTicket('Category', 'titre', 'Date', 
              (){
                print("object");
              }),
              MonTicket('Category', 'titre', 'Date', 
              (){
                print("object");
              }),
            ],
          )),
        ],
      ),
    );
  }
}
