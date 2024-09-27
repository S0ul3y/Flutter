import 'package:flutter/material.dart';
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
            const Icon(
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
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 15),
          trier(
            TrierButton('lib/images/pc.png', 'Pratique', trivert, () {
              return null;
            }),
            TrierButton('lib/images/technique.png', 'Théorique', tribleu, () {
              return null;
            }),
            TrierButton('lib/images/theorique.png', 'Technique', tricafe, () {
              return null;
            }),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'lib/images/font.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
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
                    vert,
                    'Ajouter un tichet', 
                    15, 
                    10,
                    (){
                      Navigator.pushReplacementNamed(context, '/creercompte');
                      return null;
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
                    return null;
                  }),
                  MonTicket('Category', 'titre', 'Date', 
                  (){
                    print("object");
                    return null;
                  }),
                  MonTicket('Category', 'titre', 'Date', 
                  (){
                    print("object");
                    return null;
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
