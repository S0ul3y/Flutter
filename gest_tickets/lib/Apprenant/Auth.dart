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
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              children: [

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

                SizedBox(height: 10),

                // Moninput(
                //   Colors.white,
                //   'email',
                //   Icon(
                //     Icons.email,
                //     color: vert,
                //     size: 30,
                //   ),
                // ),
                // Moninput(
                //     Colors.white,
                //     'passwore',
                //     Icon(
                //       Icons.remove_red_eye,
                //       color: vert,
                //       size: 30,
                //     ),
                    MonInput(
                        color:Colors.white,
                        text:'password',
                        icon:Icon(
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
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(vert),
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                    ),
                    onPressed: () => {print("object")},
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}




