import 'package:casotto/models/Ruolo.dart';
import 'package:casotto/services/UtenteService.dart';
import 'package:casotto/views/AllAttrezzature.dart';
import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllOrdini.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../arguments/UtenteStringArg.dart';
import 'AllEventi.dart';
import 'AllEventiAderiti.dart';
import 'AllNotifiche.dart';
import 'AllOmbrelloni.dart';
import 'AllPrenotazioniUtente.dart';
import 'AllPromozioniGestore.dart';
import 'AllPromozioniUtente.dart';
import 'AllStrutture.dart';
import 'AllUtenti.dart';
import 'Menu.dart';
import 'MessageScreen.dart';
import 'PaginaContatti.dart';
import 'PrimaPagina.dart';
import 'QRCode.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "Homepage";
  // da 32  46 E DA 244 A 537
  @override
  Widget build(BuildContext context) {
    UtenteService utenteService = new UtenteService();

    return FutureBuilder<Ruolo>(
      future: utenteService.getRuolo(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const MessageScreen(status: MessageScreenStatus.LOADING);
          case ConnectionState.none:
            return const MessageScreen(status: MessageScreenStatus.ERROR);
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const MessageScreen(status: MessageScreenStatus.ERROR);
            } else if (snapshot.hasData) {
              if (snapshot.data! == Ruolo.GESTORE) {
                /* ------GESTORE------*/

                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('HomePage'),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.teal,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.white, Icons.logout),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(
                              context,
                              PrimaPaginaView.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                        context,
                        PrimaPaginaView.routeName,
                      );
                    },
                    child: Text("LOGOUT"), //cambiare grafica logout
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
                          leading: IconButton(
                              icon:
                                  Icon(color: Colors.teal, Icons.beach_access),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllOmbrelloniView.routeName,
                                );
                              }),
                          title: Text('Visualizza Spiaggia'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.calendar_month),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  CalendarView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Prenotazioni'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.restaurant_menu),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  MenuView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Menù'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.menu_open_outlined),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllOrdiniView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Ordini'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.person),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  PaginaContattiView.routeName,
                                );
                              }),
                          title: const Text('Contatti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.event),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AllEventiView.routeName);
                              }),
                          title: const Text('Visualizza eventi'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.event_available),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AllEventiAderitiView.routeName,
                                  arguments: UtenteStringArg(
                                      FirebaseAuth.instance.currentUser!.uid),
                                  ModalRoute.withName(HomePage.routeName),
                                );
                              }),
                          title: const Text('Visualizza eventi aderiti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.build),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllAttrezzatureView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Attrezzature'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.houseboat),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllStruttureView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Strutture'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.people),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllUtentiView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Utenti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.message),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllNotificheView.routeName,
                                );
                              }),
                          title: const Text('Visualizza messaggi'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.calendar_month),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllPrenotazioniUtenteView.routeName,
                                );
                              }),
                          title: const Text('Visualizza le tue Prenotazioni'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.menu_book),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllPromozioniGestoreView.routeName,
                                );
                              }),
                          title: const Text('Visualizza promozioni'),
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
                    ),
                  ),
                );
              } else if (snapshot.data! == Ruolo.OSPITE) {
                /* ------UTENTE OSPITE------*/

                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Ospite'),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.teal,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.white, Icons.logout),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(
                              context,
                              PrimaPaginaView.routeName,
                            );
                          },
                        ),
                      ],
                    ),
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
                          leading: IconButton(
                              icon:
                                  Icon(color: Colors.teal, Icons.beach_access),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllOmbrelloniView.routeName,
                                );
                              }),
                          title: Text('Visualizza Spiaggia'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.restaurant_menu),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  MenuView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Menù'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.person),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  PaginaContattiView.routeName,
                                );
                              }),
                          title: const Text('Contatti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.event),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AllEventiView.routeName);
                              }),
                          title: const Text('Visualizza eventi'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.event_available),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AllEventiAderitiView.routeName,
                                  arguments: UtenteStringArg(
                                      FirebaseAuth.instance.currentUser!.uid),
                                  ModalRoute.withName(HomePage.routeName),
                                );
                              }),
                          title: const Text('Visualizza eventi aderiti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.message),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllNotificheView.routeName,
                                );
                              }),
                          title: const Text('Visualizza messaggi'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.calendar_month),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllPrenotazioniUtenteView.routeName,
                                );
                              }),
                          title: const Text('Visualizza le tue Prenotazioni'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.list),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllPromozioniUtenteView.routeName,
                                );
                              }),
                          title: const Text('Visualizza promozioni attive'),
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
                    ),
                  ),
                );
              } else if (snapshot.data! == Ruolo.REGISTRATO) {
                /* ------UTENTE REGISTRATO------*/

                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Registrato'),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.teal,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.white, Icons.logout),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(
                              context,
                              PrimaPaginaView.routeName,
                            );
                          },
                        ),
                      ],
                    ),
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
                          leading: IconButton(
                              icon:
                                  Icon(color: Colors.teal, Icons.beach_access),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllOmbrelloniView.routeName,
                                );
                              }),
                          title: Text('Visualizza Spiaggia'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.restaurant_menu),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  QRCodeView.routeName,
                                );
                              }),
                          title: const Text('Abilitati con il QRCode'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.person),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  PaginaContattiView.routeName,
                                );
                              }),
                          title: const Text('Contatti'),
                        ),
                        ListTile(
                          leading: IconButton(
                              icon: Icon(color: Colors.teal, Icons.message),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllNotificheView.routeName,
                                );
                              }),
                          title: const Text('Visualizza messaggi'),
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
                    ),
                  ),
                );
              } else {
                /* ------ADDETTO SPIAGGIA------*/

                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Addetto Spiaggia'),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                        context,
                        PrimaPaginaView.routeName,
                      );
                    },
                    child: Text("LOGOUT"), //cambiare grafica logout
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
                          leading: IconButton(
                              icon: Icon(
                                  color: Colors.teal, Icons.menu_open_outlined),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AllOrdiniView.routeName,
                                );
                              }),
                          title: const Text('Visualizza Ordini'),
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
                    ),
                  ),
                );
              }
            }
            return const MessageScreen(status: MessageScreenStatus.ERROR);
        }
      },
    );
  }
}
