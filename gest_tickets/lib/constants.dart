import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'Apprenant/home.dart';

const Color vert = Color(0xFF97C93F);
const Color sombre = Color(0xFF0A1733);
const Color trivert = Color(0xFF8CD8C1);
const Color tribleu = Color(0xFF89BCED);
const Color tricafe = Color(0xFFE5D7A3);

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
  return Row(
    // MainAxisSize mainAxisSize = MainAxisSize.max,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      bloc1,
      // SizedBox(width: 16),
      bloc2,
      // SizedBox(width: 16),
      bloc3,
    ],
  );
}

ElevatedButton TrierButton(
    String img, String texte, Color color, Function? Onpress()) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(color),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
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
            style: TextStyle(
              color: sombre,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          )
        ],
      ),
    ),
  );
}

// Padding Moninput(Color color, String text, Icon icon,final controller, bool obscruretext, Icon? suffix) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(25), // Assurez-vous que le radius est cohérent avec le TextField
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(97, 150, 201, 63), // Couleur de l'ombre avec opacité
//             spreadRadius: 3,  // Rayon de diffusion
//             blurRadius: 5,    // Rayon de flou
//             offset: Offset(0, 0), // Décalage de l'ombre
//           ),
//         ],
//       ),
//       child: TextField(
//         obscureText: obscruretext,
//         controller: controller,
//         decoration: InputDecoration(
//           prefixIcon: icon,
//           suffix: suffix,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: color),
//           ),
//           hintText: text,
//           filled: true,
//           fillColor: color,
//           // contentPadding: EdgeInsets.symmetric(horizontal: 20)
//         ),
//       ),
//     ),
//   );
// }

class MonInput extends StatelessWidget {
  //  MonInput({super.key});
  final Color color;
  final String text;
  final Icon icon;
  final controller;
  final bool obscruretext;
  // final ElevatedButton? suffix;

  const MonInput({
    required this.color,
    required this.text,
    required this.icon,
    required this.controller,
    required this.obscruretext,
    //  this.suffix,
  });

  // hidepass() {
  //   return ElevatedButton.icon(
  //     onPressed: () => {
  //       if (this.obscruretext == false)
  //         {this.obscruretext == true}
  //       else
  //         {this.obscruretext == false}
  //     },
  //     label: Icon(
  //       Icons.remove_red_eye,
  //       color: vert,
  //       size: 30,
  //     ),
  //   );
  // }

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
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
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
