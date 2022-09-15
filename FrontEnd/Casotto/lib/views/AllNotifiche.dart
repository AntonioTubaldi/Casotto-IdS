import 'package:casotto/models/Notifica.dart';
import 'package:casotto/services/UtenteService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/NotificaTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllNotificheView extends StatefulWidget {
  const AllNotificheView({Key? key}) : super(key: key);

  static const String routeName = "AllNotifiche";

  @override
  State<AllNotificheView> createState() => _AllNotificheViewState();
}

class _AllNotificheViewState extends State<AllNotificheView> {
  UtenteService utenteService = new UtenteService();

  List<Widget> _getNotificheTabs(List<Notifica> notifiche) {
    return notifiche.map((Notifica singleNotifica) {
      return NotificaTab(singleNotifica: singleNotifica);
    }).toList();
  }

  Widget _getScrollableView(List<Notifica> notificheList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getNotificheTabs(notificheList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Notifica>>(
      future: utenteService
          .visualizzaMessaggi(FirebaseAuth.instance.currentUser!.uid),
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
              if (snapshot.data!.isNotEmpty) {
                List<Notifica> list = snapshot.data!;
                return Scaffold(
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.home),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              arguments: const HomePage(),
                              ModalRoute.withName(HomePage.routeName),
                            );
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Messaggi'),
                  ),
                  body: _getScrollableView(list),
                  floatingActionButton: Row(
                    children: [
                      SizedBox(width: 40.0),
                      Container(
                        child: RawMaterialButton(
                          onPressed: () => {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              arguments: const HomePage(),
                              ModalRoute.withName(HomePage.routeName),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text("Visualizza Messaggi"),
                  ),
                  body: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                          child: Text("Non ci sono messaggi nella tua bacheca",
                              style: TextStyle(fontSize: 15))),
                    ],
                  )),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.home),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              arguments: const HomePage(),
                              ModalRoute.withName(HomePage.routeName),
                            );
                          },
                        ),
                        const Spacer(),
                      ],
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
