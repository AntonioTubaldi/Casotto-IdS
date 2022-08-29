import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllOrdini.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:flutter/material.dart';
import 'AllEventi.dart';
import 'AllOmbrelloni.dart';
import 'Menu.dart';
import 'PaginaContatti.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "Homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text('HomePage'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text(
                  'Casotto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              /**
               * cliccare l'icona per aprire la pagina;
               * */
              ListTile(
                leading:  IconButton(icon: Icon(color:Colors.teal ,Icons.beach_access), onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AllOmbrelloniView.routeName,
                  );
                }),
                title: Text('Visualizza Spiaggia'),
              ),
              ListTile(
                leading: IconButton(icon: Icon(color:Colors.teal ,Icons.calendar_month), onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CalendarView.routeName,
                  );
                }),
                title: const Text('Visualizza Prenotazioni'),
              ),
              ListTile(
                leading: IconButton(icon: Icon(color:Colors.teal ,Icons.restaurant_menu), onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MenuView.routeName,
                  );
                }),
                title: const Text('Visualizza Menù'),
              ),
              ListTile(
                leading: IconButton(icon: Icon(color:Colors.teal ,Icons.menu_open_outlined), onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AllOrdiniView.routeName,
                  );
                }),
                title: const Text('Visualizza Ordini'),
              ),
              ListTile(
        leading: IconButton(icon: Icon(color:Colors.teal ,Icons.person), onPressed: () {
          Navigator.pushNamed(
            context,
            PaginaContattiView.routeName,
          );
        }),
        title: const Text('Contatti'),
              ),

      ListTile(
        leading: IconButton(icon: Icon(color:Colors.teal ,Icons.event), onPressed: () {
          Navigator.pushNamed(
            context,
              AllEventiView.routeName
          );
        }),
        title: const Text('Visualizza eventi'),
      ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/spiaggia.jpg"),
                fit: BoxFit.cover),
          )));
  }
}
