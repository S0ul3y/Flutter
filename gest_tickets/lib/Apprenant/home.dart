import 'package:flutter/material.dart';
import 'package:gest_tickets/Apprenant/chat.dart';
import 'package:gest_tickets/Apprenant/profile.dart';
import 'package:gest_tickets/Apprenant/ticket.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Accueil.dart';


const Color vert = Color(0xFF97C93F);
const Color sombre = Color(0xFF0A1733);

class HomeApprenant extends StatefulWidget {
  @override
  State<HomeApprenant> createState() => _HomeApprenantState();
}

class _HomeApprenantState extends State<HomeApprenant> {



  int CurrentIndex = 0;
  void ChangeContenue(int index) {
    setState(() {
      CurrentIndex = index;
    });
     
  }

  @override
  Widget build(BuildContext context) {

final List<Widget> MesPages =[
     Accueil(),
     tichet(),
     chat(),
     profile()
  ]; 

    return Scaffold(
      body: MesPages[CurrentIndex],
      backgroundColor: sombre,
      bottomNavigationBar: Container(
        // color:Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            selectedIndex: CurrentIndex,
            onTabChange: ChangeContenue,
            gap: 10,
            // backgroundColor: Colors.white,
            color: Colors.white,
            activeColor: vert,
            tabBackgroundColor: const Color.fromARGB(220, 70, 71, 71),
            padding: EdgeInsets.all(10),
            // tabBorderRadius: 50,

            tabs: const [
              GButton(
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: vert,
                ),
                icon: Icons.home,
                text: 'Acceuil',
              ),
              GButton(
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: vert,
                ),

                icon: FontAwesomeIcons.ticket,
                text: 'Ticket',
                // leading: FaIcon(FontAwesomeIcons.ticket),
              ),
              GButton(
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: vert,
                ),
                icon: Icons.message,
                text: 'Message',
              ),
              GButton(
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: vert,
                ),
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
