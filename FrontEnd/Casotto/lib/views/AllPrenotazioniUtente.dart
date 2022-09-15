import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Prenotazione.dart';
import '../services/PrenotazioneService.dart';
import '../widgets/PrenotazioniUtenteTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllPrenotazioniUtenteView extends StatefulWidget {
  const AllPrenotazioniUtenteView({Key? key}) : super(key: key);

  static const String routeName = "AllPrenotazioniUtente";

  @override
  State<AllPrenotazioniUtenteView> createState() =>
      _AllPrenotazioniUtenteViewState();
}

class _AllPrenotazioniUtenteViewState extends State<AllPrenotazioniUtenteView> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  List<Widget> _getPrenotazioniTabs(List<Prenotazione> prenotazioni) {
    return prenotazioni.map((Prenotazione singlePrenotazione) {
      return PrenotazioniUtenteTab(singlePrenotazione: singlePrenotazione);
    }).toList();
  }

  Widget _getScrollableView(List<Prenotazione> prenotazioneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getPrenotazioniTabs(prenotazioneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Prenotazione>>(
      future: _prenotazioneService
          .findAllByIdUtente(FirebaseAuth.instance.currentUser!.uid),
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
                List<Prenotazione> list = snapshot.data!;
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
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Le tue prenotazioni'),
                  ),
                  body: _getScrollableView(list),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text("Visualizza le tue prenotazioni"),
                  ),
                  floatingActionButton: RawMaterialButton(
                    constraints: BoxConstraints.expand(width: 120, height: 50),
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  body: Center(
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text("Non ci sono prenotazioni da mostrare"),
                    ),
                  ),
                );
              }
            }
        }
        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
