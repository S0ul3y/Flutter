import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/Auth.dart';
import 'package:gest_tickets/Apprenant/home.dart';

class FirstPagState extends StatefulWidget {
  const FirstPagState({super.key});

  @override
  State<FirstPagState> createState() => __FirstPagStateState();
}

class __FirstPagStateState extends State<FirstPagState> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_) => Auth()),
      // );
      Navigator.push(
        context,
      MaterialPageRoute(builder: (context) => Auth(),)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sombre,
      body: Center(
        child: Container(
          width: 150,
          height: 250,
          child: Column(
            children: [
              Image.asset('lib/images/logo.png'),
              SizedBox(height: 10),
              CircularProgressIndicator()
          ],),

        ),
      ),
    );
  }
}
