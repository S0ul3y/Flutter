import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/Auth.dart';
import 'package:gest_tickets/constants.dart';

// import 'home.dart';
class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: sombre,
        body: ListView(
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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

            // Container(
            //   width: double.infinity,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Image.asset('lib/images/font.png',
            //     fit: BoxFit.cover,),

            //   ),
            // )
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  // Image de fond
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'lib/images/font.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Texte par-dessus l'image
                  Positioned(
                    top:
                        20, // Vous pouvez ajuster ces valeurs selon vos besoins
                    left: 20,
                    // right: 0,
                    // bottom: 0,
                    child: Center(
                      child: Text(
                        "T'as interêt à apprendre\n mon pote",
                        style: TextStyle(
                            color: Colors.white, // Couleur du texte
                            fontSize: 35, // Taille du texte
                            fontWeight: FontWeight.bold, // Style du texte
                            fontFamily: 'poppins'),
                      ),
                    ),
                  ),

                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(vert),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20)),
                          ),
                          onPressed: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return  Auth();
                                },
                                fullscreenDialog: true,
                                ))
                              },
                          child: Text(
                            "Ajouter un ticket",
                            style: TextStyle(
                              color: sombre,
                              fontWeight: FontWeight.bold,
                            ),
                          )))
                ],
              ),
            )
          ],
        ));
  }
}
