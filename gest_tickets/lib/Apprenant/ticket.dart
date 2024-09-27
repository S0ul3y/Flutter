import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/DetailTicket.dart';
import 'package:gest_tickets/constants.dart';

class tichet extends StatelessWidget {
  String? ID;

  tichet({super.key});
  @override
  Widget build(BuildContext context) {

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      ID = currentUser.uid;
    }



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
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.search,
                    color: Colors.white), // Ajouter l'icône de recherche ici
              ),
              style: const TextStyle(color: Colors.white), // Couleur du texte saisi
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          trier(
              TrierButton('lib/images/pc.png', 'Pratique', trivert, () {
                return null;
              }),
              TrierButton(
                  'lib/images/technique.png', 'Théorique', tribleu, () {
                    return null;
                  }),
              TrierButton(
                  'lib/images/theorique.png', 'Technique', tricafe, () {
                    return null;
                  })),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('.'),
                MonButton(vert,'Ajouter un ticket', 15, 10, () {
                  Navigator.pushReplacementNamed(context, '/addticket');
                  return null;
                })
              ],
              // child:
            ),
          ),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Ticket')
                  .where('userid', isEqualTo: ID.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('Vous n\'avez pas de ticket', style: TextStyle(color: Colors.white)));
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return MonTicket(
                      doc['cathegorie'],
                      doc['titre'],
                      (doc['date']), // Assurez-vous que la date est enregistrée dans Firestore
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              ticketId: doc.id
                              ,
                              categorie: doc['cathegorie'],
                              titre: doc['titre'],
                              description: doc['description'],
                              reponse: doc['reponse'],
                              date: doc['date'],
                              // date: (doc['date'] as Timestamp).toDate(),
                            ),
                          ),
                        );
                        return null;
                      },
                    );
                  }).toList(),
                );
                },
            ),
          ),
        ],
      
        
      ),
    );
  }
}
