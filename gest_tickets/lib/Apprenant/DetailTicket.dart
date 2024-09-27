import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/constants.dart';

class Detail extends StatelessWidget {
  // const Detail({super.key});

  final String ticketId;
  final String categorie;
  final String titre;
  final String description;
  final String reponse;
  final String date;

   const Detail({super.key, 
    required this.ticketId,
    required this.titre,
    required this.categorie,
    required this.description,
    required this.reponse,
    required this.date,
  });


// Modification de ticket

  // Modification de ticket
  void modifierTicket(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String newCategorie = categorie;
    String newTitre = titre;
    String newDescription = description;
    String newReponse = reponse;
    String newDate = date;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modifier le Ticket"),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    initialValue: categorie,
                    decoration: const InputDecoration(labelText: 'Catégorie'),
                    onChanged: (value) => newCategorie = value,
                  ),
                  TextFormField(
                    initialValue: titre,
                    decoration: const InputDecoration(labelText: 'Titre'),
                    onChanged: (value) => newTitre = value,
                  ),
                  TextFormField(
                    initialValue: description,
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: (value) => newDescription = value,
                  ),
                  TextFormField(
                    initialValue: reponse,
                    decoration: const InputDecoration(labelText: 'Réponse'),
                    onChanged: (value) => newReponse = value,
                  ),
                  TextFormField(
                    initialValue: date,
                    decoration: const InputDecoration(labelText: 'Date'),
                    onChanged: (value) => newDate = value,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Fermer le pop-up sans sauvegarder
              },
              child: const Text("Annuler"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Mettre à jour le ticket dans Firestore
                  await FirebaseFirestore.instance
                      .collection('Ticket')
                      .doc(ticketId)
                      .update({
                    'cathegorie': newCategorie,
                    'titre': newTitre,
                    'description': newDescription,
                    'reponse': newReponse,
                    'date': newDate,
                  });
                  Detail(ticketId: ticketId,
                   titre: newTitre, 
                   categorie: newCategorie, 
                   description: newDescription, 
                   reponse: newReponse, 
                   date: newDate);
                  Navigator.of(context).pop(); // Fermer le pop-up après la mise à jour
                  // Navigator.pushReplacementNamed(context, :)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                       ticketId:  ticketId,
                        titre: newTitre, 
                        categorie: newCategorie, 
                        description: newDescription, 
                        reponse: newReponse, 
                        date: newDate
                        // date: (doc['date'] as Timestamp).toDate(),
                      ),
                    ),
                  );
                }
              },
              child: const Text("Sauvegarder"),
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sombre,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 20,right: 20),
        child: ListView(
          
          children: [
            BackBTN(
              (){
                //  Navigator.pushReplacementNamed(context, '/ListeTicket');
                Navigator.pop(context);
                return null;
                // print('object');
              }
            ),
            const SizedBox(height: 20,),
            const Text(
              'Détail du tiket',
              style: TextStyle(color: vert,fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                  categorie,
                  style: const TextStyle(
                      color: vert,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins'),
                ),
                 Text(
                  date,
                  style: const TextStyle(
                      color: vert,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins'),
                ),


                ],
              
            ),
           
            const SizedBox(height: 20,),
            const Text(
              'Titre',
              style: TextStyle(color: vert,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
            Text(
              titre,
              style: const TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),

            
            const SizedBox(height: 20,),
            const Text(
              'Description',
              style: TextStyle(color: vert,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
            Text(
              description,
              style: const TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),

            
            const SizedBox(height: 20,),
            const Text(
              'Reponses',
              style: TextStyle(color: vert,fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
            Text(
              reponse,
              style: const TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),

            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonButton(vert,'Modifier', 50, 20, (){
                  modifierTicket(context);
                  
                }),
                MonButton(Colors.red,'Supprimer', 50, 20, (){
                  print(ticketId);
                })
              ],
            )
            
          ],
        ),
      ),
    );
  }
}



