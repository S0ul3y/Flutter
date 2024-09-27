import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'Apprenant/home.dart';

const Color vert = Color(0xFF97C93F);
const Color sombre = Color(0xFF0A1733);
const Color trivert = Color(0xFF8CD8C1);
const Color tribleu = Color(0xFF89BCED);
const Color tricafe = Color(0xFFE5D7A3);
const Color ticketColor = Color(0xffed9d9d9);

Widget topBar(Image image, Icon icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [image, icon],
    ),
  );
}

Widget trier(ElevatedButton bloc1, ElevatedButton bloc2, ElevatedButton bloc3) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Expanded(flex: 1,  child: bloc1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Expanded(flex: 1,  child: bloc2),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Expanded(flex: 1,  child: bloc3),
        ),
        // Expanded(flex: 1, child: bloc2),
        // Expanded(flex: 1, child: bloc3)
        // bloc1,
        // bloc2,
        // bloc3,
      ],
    ),
  );
}

ElevatedButton TrierButton(
    String img, String texte, Color color, Function? Function() Onpress) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(color),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
    ),
    onPressed: () {
      Onpress();
    },
    child: Container(
      // width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            width: 40,
            height: 40,
          ),
          Text(
            texte,
            style: const TextStyle(
              color: sombre,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          )
        ],
      ),
    ),
  );
}

class MonInput extends StatelessWidget {
  //  MonInput({super.key});
  final Color color;
  final String text;
  final Icon icon;
  final controller;
  final bool obscruretext;
  // final ElevatedButton? suffix;

  const MonInput({super.key, 
    required this.color,
    required this.text,
    required this.icon,
    required this.controller,
    required this.obscruretext,
    //  this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    // if (suffix == ElevatedButton) {
    //   this.hidepass();
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
              25), // Assurez-vous que le radius est cohérent avec le TextField
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(
                  97, 150, 201, 63), // Couleur de l'ombre avec opacité
              spreadRadius: 3, // Rayon de diffusion
              blurRadius: 5, // Rayon de flou
              offset: Offset(0, 0), // Décalage de l'ombre
            ),
          ],
        ),
        child: TextField(
          obscureText: obscruretext,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: icon,

            // suffix: suffix,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: color),
            ),
            hintText: text,
            filled: true,
            fillColor: color,
            // contentPadding: EdgeInsets.symmetric(horizontal: 20)
          ),
        ),
      ),
    );
  }
}

ElevatedButton MonButton(
   Color couleur, String nombtn, double long, double larg,  Function ?  Function () onTap) {
  return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(couleur),
        padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: long, vertical: larg)),
      ),
      onPressed: () => onTap(),
      child: Text(
        nombtn,
        style:
            const TextStyle(color: sombre, fontSize: 15, fontWeight: FontWeight.bold),
      ));
}

Padding BackBTN(Function? Function() AuClic) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => AuClic(),
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(vert),
                shadowColor: WidgetStatePropertyAll(sombre)),
            icon: const Icon(
              Icons.arrow_back,
              color: sombre,
            )),
      ],
    ),
  );
}

Padding MonTicket(
  String Category, String titre, String Date, Function? Function() Btnplus) {
  return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ticketColor,
          ),
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      // width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: vert,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/images/ticket.png',
                          fit: BoxFit.scaleDown,
                        ),
                      )),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                          backgroundColor: vert,
                          label: Text(
                            Category,
                            style: const TextStyle(
                                color: sombre, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          titre,
                          overflow: TextOverflow.ellipsis, // Coupe le texte et ajoute "..." à la fin
                          maxLines: 2,
                        ),
                        Text(
                          Date,
                          style: const TextStyle(
                            color: sombre,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: Btnplus,
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(vert),
                              shadowColor: WidgetStatePropertyAll(sombre)),
                          icon: const Icon(
                            Icons.remove_red_eye_sharp,
                            color: ticketColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      
  );
}



























// Widget ListView(){
//     return Padding(
//       padding: (

//       )
//     )
// }



// Widget Recherche(inp)

// // var MybottomNav = Container(
// //   // color:Colors.white,
// //   child: Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //     child: GNav(

// //       selectedIndex: currentIndex,

// //       onTabChange: ChangeContenue,

// //       gap: 10,
// //       // backgroundColor: Colors.white,
// //       color: Colors.white,
// //       activeColor: vert,
// //       tabBackgroundColor: const Color.fromARGB(220, 70, 71, 71),
// //       padding: EdgeInsets.all(10),
// //       // tabBorderRadius: 50,

// //       tabs: const [
// //         GButton(
// //           textStyle: TextStyle(
// //             fontFamily: 'Poppins',
// //             color: vert,
// //           ),
// //           icon: Icons.home,
// //           text: 'Acceuil',
// //         ),
// //         GButton(
// //           textStyle: TextStyle(
// //             fontFamily: 'Poppins',
// //             color: vert,
// //           ),

// //           icon: FontAwesomeIcons.ticket,
// //           text: 'Ticket',
// //           // leading: FaIcon(FontAwesomeIcons.ticket),
// //         ),
// //         GButton(
// //           textStyle: TextStyle(
// //             fontFamily: 'Poppins',
// //             color: vert,
// //           ),
// //           icon: Icons.message,
// //           text: 'Message',
// //         ),
// //         GButton(
// //           textStyle: TextStyle(
// //             fontFamily: 'Poppins',
// //             color: vert,
// //           ),
// //           icon: Icons.person,
// //           text: 'Profile',
// //         ),
// //       ],
// //     ),
// //   ),
// // );
