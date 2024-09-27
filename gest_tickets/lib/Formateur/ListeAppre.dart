import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/CreerCompte.dart';
import 'package:gest_tickets/constants.dart';

class ListeApp extends StatelessWidget {
  // final Color vert =
  //     Color(0xFF00FF00); // Assurez-vous de définir la couleur verte

    



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MonButton(vert, 'Ajouter un compte', 15, 20, () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: context.));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Compte()),
                  );
                }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              // Suppression des bordures extérieures et ajout de bordures intérieures uniquement
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: vert, // Maintien de la couleur verte avec opacité
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nom',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Prénom',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rôle',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Action',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                
              ],
            ),
            SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.
                collection('Users')
                .snapshots(), 
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child:  CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(child: Text('Erreur : ${snapshot.error}'),);
                  }
                  if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                    return Center( child: Text('Aucun utilisateur trouvé'),);
                  }

                  final users = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var user = users[index];
                      return Table(
                        border: TableBorder.symmetric(
                          inside: BorderSide(color: Colors.grey.shade300, width: 1.0),),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(user['nom']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(user['prenom']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(user['email']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(user['role']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Suppression de l'utilisateur
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(user.id)
                                            .delete();
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Action pour l'édition de l'utilisateur
                                      },
                                      icon: Icon(Icons.edit_square),
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:gest_tickets/Apprenant/home.dart';

// // class ListeApp extends StatelessWidget {
// //   const ListeApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ListView(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(top: 50),
// //             child: Column(
// //               children: [
// //                 Container(

// //                   child: LayoutBuilder(
// //                     builder: (context, layout){
// //                       double width = layout.maxWidth;
// //                       return
// //                       Column(
// //                         children: [

// //                           Container(
// //                           decoration: BoxDecoration(
// //                           color: const Color.fromARGB(74, 10, 23, 51),
// //                           borderRadius: BorderRadius.only(
// //                           topLeft: Radius.circular(20),
// //                           topRight: Radius.circular(20)
// //                           )
// //                           ),
// //                           width: width*0.90,
// //                           child: Padding(
// //                           padding: const EdgeInsets.all(10),
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                             children: [
// //                               Text('Nom', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
// //                               Text('Prénom', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
// //                               Text('Email', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
// //                               Text('Rôle', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
// //                               Text('Action', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),

// //                             ],
// //                           ),
// //                             ),
// //                           ),

// //                           SizedBox(height: 10),

// //                           Container(
// //                           // decoration: BoxDecoration(
// //                           // color: const Color.fromARGB(74, 10, 23, 51),
// //                           // borderRadius: BorderRadius.only(
// //                           // topLeft: Radius.circular(20),
// //                           // topRight: Radius.circular(20)
// //                           // )
// //                           // ),
// //                           width: width*0.90,
// //                           child: Padding(
// //                           padding: const EdgeInsets.all(10),
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                             children: [
// //                               Text('Maiga', style:TextStyle(fontSize: 15,) ,),
// //                               Text('Souleymane', style:TextStyle(fontSize: 15,) ,),
// //                               Text('maiga@gmail.com', style:TextStyle(fontSize: 15,) ,),
// //                               Text('Admin', style:TextStyle(fontSize: 15,) ,),
// //                               Icon(Icons.person_2)

// //                             ],
// //                           ),
// //                             ),
// //                           ),
// //                         ],
// //                       );

// //                     }),
// //                 ),

// //               ],
// //             ),
// //           )
// //         ],
// //       )

// //     );
// //   }
// // }

// class ListeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Table Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Table(
//           border: TableBorder.all(
//                color : const Color.fromARGB(210, 0, 0, 0),
//                width : 0.0,
//                style : BorderStyle.solid,
//                borderRadius :BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//                ),

//             //    inside: BorderSide.none,
//             // outside: BorderSide.none,
//             // borderRadius: BorderRadius.only(),

//           ), //  Bordures autour des cellules
//           children: [
//             TableRow(
//                   // decoration: const DecoratedBox(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                     gradient: RadialGradient(
//                       center: Alignment(-0.5, -0.6),
//                       radius: 0.15,
//                       colors: <Color>[
//                         Color.fromARGB(0, 238, 238, 238),
//                         vert,
//                       ],
//                       // stops: [0.9, 1.0],
//                     ),
//                   ),
//                   // ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Nom',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Prénom',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Email',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Rôle',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Action',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//               ],
//             ),
//             TableRow(

//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Row 1 Col 1'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Row 1 Col 2'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Row 1 Col 3'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Row 1 Col 3'),
//                 ),
//                 Container(
//                   height: 100,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [

//                       IconButton(
//                         onPressed:(){ print('');} ,
//                         icon: Icon(Icons.delete),color: Colors.red,
//                       ),
//                       IconButton(
//                         onPressed:(){ print('');} ,
//                         icon: Icon(Icons.edit_square),color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // TableRow(
//             //   children: [
//             //     Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: Text('Row 2 Col 1'),
//             //     ),
//             //     Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: Text('Row 2 Col 2'),
//             //     ),
//             //     Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: Text('Row 2 Col 3'),
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
