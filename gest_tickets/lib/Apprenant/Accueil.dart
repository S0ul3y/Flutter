import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/Auth.dart';
import 'package:gest_tickets/constants.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: sombre,
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 15),
          trier(
            TrierButton('lib/images/pc.png', 'Pratique', trivert, () {}),
            TrierButton('lib/images/technique.png', 'Théorique', tribleu, () {}),
            TrierButton('lib/images/theorique.png', 'Technique', tricafe, () {}),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'lib/images/font.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Center(
                    child: Text(
                      "T'as intérêt à apprendre\n mon pote",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: MonButton(
                    'Ajouter un tichet', 
                    15, 
                    10,
                    (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Auth();
                        },
                        fullscreenDialog: true,
                      ));
                    },
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                MonTicket('Category', 'titre', 'Date', 
                  (){
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
                    // Ajoute autant de containers ou d'éléments que nécessaire
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
