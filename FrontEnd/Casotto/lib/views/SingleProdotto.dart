import 'package:casotto/models/Prodotto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../arguments/ProdottoStringArgs.dart';
import '../arguments/SingleProdottoViewArgs.dart';
import '../models/Ruolo.dart';
import '../services/UtenteService.dart';
import 'ConfermaEliminazioneProdotto.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';
import 'ProdottoEliminato.dart';
import 'SceltaPrezzoProdotto.dart';

class SingleProdottoView extends StatelessWidget {
  const SingleProdottoView({Key? key, required this.singleProdotto})
      : super(key: key);

  final Prodotto singleProdotto;
  static const String routeName = "SingleProdotto";

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
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("Scheda Prodotto"),
                      backgroundColor: Colors.teal,
                    ),
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
                    body: SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(children: [
                                        Text(
                                            "prodotto: ${singleProdotto.getNome()}",
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        Text(
                                          "prezzo: ${singleProdotto.getPrezzo()} Euro",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ] //children
                                          ),
                                    ),
                                  )
                                ]),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RawMaterialButton(
                                onPressed: () => {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    ConfermaEliminazioneProdottoView.routeName,
                                    arguments:
                                        SingleProdottoViewArgs(singleProdotto),
                                    ModalRoute.withName(HomePage.routeName),
                                  ),
                                },
                                fillColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                constraints: const BoxConstraints.tightFor(
                                    height: 50.0, width: 200),
                                child: const Text(
                                  "Elimina Prodotto",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: RawMaterialButton(
                                onPressed: () => {
                                  Navigator.pushNamed(
                                    context,
                                    SceltaPrezzoProdottoView.routeName,
                                    arguments: ProdottoStringArgs(
                                      singleProdotto.getNome(),
                                    ),
                                  ),
                                },
                                fillColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                constraints: const BoxConstraints.tightFor(
                                    height: 50.0, width: 200),
                                child: const Text(
                                  "Modifica Prodotto",
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("Scheda Prodotto"),
                      backgroundColor: Colors.teal,
                    ),
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
                    body: SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(children: [
                                        Text(
                                            "prodotto: ${singleProdotto.getNome()}",
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        Text(
                                          "prezzo: ${singleProdotto.getPrezzo()} Euro",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ] //children
                                          ),
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
              return const MessageScreen(status: MessageScreenStatus.ERROR);
          }
        });
  }
}
