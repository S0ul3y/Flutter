import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gest_tickets/Formateur/ListeAppre.dart';
import 'package:gest_tickets/Formateur/ListeTicket.dart';
import 'package:gest_tickets/constants.dart';
// import 'ListeApp';

class dashform extends StatefulWidget {
  @override
  _dashformState createState() => _dashformState();
}

class _dashformState extends State<dashform> {
  Widget _currentPage = DashboardPage();

  void _selectPage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWebFormat = constraints.maxWidth > 800;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: sombre,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: Row(
            children: [
              if (isWebFormat)
                Container(
                  width: 250,
                  color: Colors.black,
                  child: drawerContent(),
                ),
              Expanded(
                child: _currentPage,
              ),
            ],
          ),
          drawer: isWebFormat ? null : Drawer(child: drawerContent()),
        );
      },
    );
  }

  Widget drawerContent() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: sombre,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                'lib/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.dashboard_customize_outlined, color: Colors.white),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              _selectPage(DashboardPage());
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.ticket, color: Colors.white),
            title: Text('Liste des tickets',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              _selectPage(TicketListPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.person_3_sharp, color: Colors.white),
            title: Text('Liste des Apprenants',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              _selectPage(ListeApp());
            },
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Bienvenue au Dashboard')),
    );
  }
}



class ApprenantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Voici la liste des Apprenants')),
    );
  }
}
