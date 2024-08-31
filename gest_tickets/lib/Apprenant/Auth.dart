import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gest_tickets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  // const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final EmailContro = TextEditingController();
    final PassContro = TextEditingController();

    return Scaffold(
      backgroundColor: sombre,
      body: ListView(
        children: [
          Center(
            child: Container(
              width: 400,
              child: Column(
                children: [
                  BackBTN(() {
                    print('object');
                  }),

                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.only(top: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Center(
                  //         // decoration: BoxDecoration(
                  //         //   color: vert,
                  //         //   shape: BoxShape.circle
                  //         // ),

                  //         child: ElevatedButton.icon(
                  //             iconAlignment: IconAlignment.start,
                  //             style: ButtonStyle(
                  //               backgroundColor: WidgetStatePropertyAll(sombre),
                  //               padding: WidgetStatePropertyAll(
                  //                   EdgeInsets.symmetric(
                  //                       horizontal: 10, vertical: 10)),
                  //             ),
                  //             onPressed: () => print("salut"),
                  //             label: Icon(
                  //               Icons.arrow_back_ios,
                  //               color: Colors.white,
                  //               size: 30,
                  //             )),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Text('.'),

                  Container(
                      width: 300,
                      height: 280,
                      child: Image.asset(
                        'lib/images/Auth.png',
                        fit: BoxFit.contain,
                      )),

                  // SizedBox(height: 5),

                  Text(
                    'Connexion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.bold),
                  ),

                  MonInput(
                    color: Colors.white,
                    text: 'Email',
                    icon: Icon(
                      Icons.email,
                      color: vert,
                      size: 30,
                    ),
                    controller: EmailContro,
                    obscruretext: false,
                  ),
                  MonInput(
                    color: Colors.white,
                    text: 'password',
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: vert,
                      size: 30,
                    ),
                    controller: PassContro,
                    obscruretext: true,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  MonButton('Se connecter', 30, 20, () {
                    print("object");
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
