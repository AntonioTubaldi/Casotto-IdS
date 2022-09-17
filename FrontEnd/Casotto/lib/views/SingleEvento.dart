import 'package:casotto/arguments/IscrizioneEventoViewArgs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../arguments/ModificaPartecipantiEventoArgs.dart';
import '../arguments/SingleEventoViewArgs.dart';
import '../models/Evento.dart';
import '../models/Ruolo.dart';
import '../services/UtenteService.dart';
import 'ConfermaEliminazioneEvento.dart';
import 'HomePage.dart';
import 'IscrizioneAdEvento.dart';
import 'MessageScreen.dart';
import 'ModificaPartecipantiEvento.dart';

class SingleEventoView extends StatefulWidget {
  const SingleEventoView({Key? key, required this.singleEvento})
      : super(key: key);

  final Evento singleEvento;
  static const String routeName = "SingleEvento";

  @override
  State<SingleEventoView> createState() => _SingleEventoViewState();
}

class _SingleEventoViewState extends State<SingleEventoView> {
  UtenteService utenteService = new UtenteService();

  Widget? _iscrizioneEvento() {
    if (widget.singleEvento.getNumeroPartecipanti() <
        widget.singleEvento.getNumeroMaxPartecipanti()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  IscrizioneAdEventoView.routeName,
                  arguments: IscrizioneEventoViewArgs(
                      FirebaseAuth.instance.currentUser!.uid,
                      widget.singleEvento.getIdEvento()),
                );
              },
              child: Text(
                "Iscriviti",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {},
            child: const Text(
              "L'evento è pieno",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            fillColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    floatingActionButton: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: RawMaterialButton(
                            onPressed: () => {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomePage.routeName,
                                arguments: const HomePage(),
                                ModalRoute.withName(HomePage.routeName),
                              ),
                            },
                            child: const Text("Home",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white)),
                            fillColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            constraints: BoxConstraints.tightFor(
                                height: 50.0, width: 150),
                          ),
                        ),
                      ],
                    ),
                    appBar: AppBar(
                      title: Text("Riepilogo Evento"),
                      backgroundColor: Colors.teal,
                    ),
                    body: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.singleEvento.getNome(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Data: " +
                                      widget.singleEvento.getDataString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Inizia alle: " +
                                      widget.singleEvento
                                          .getOrarioInizioString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Iscritti: " +
                                      widget.singleEvento
                                          .getNumeroPartecipanti()
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: RawMaterialButton(
                              onPressed: () => {
                                Navigator.pushNamed(
                                  context,
                                  ConfermaEliminazioneEventoView.routeName,
                                  arguments: SingleEventoViewArgs(
                                    widget.singleEvento,
                                  ),
                                ),
                              },
                              child: const Text("Elimina Evento",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              fillColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 50.0, width: 200),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: RawMaterialButton(
                              onPressed: () => {
                                Navigator.pushNamed(
                                  context,
                                  ModificaPartecipantiEventoView.routeName,
                                  arguments: ModificaPartecipantiEventoArgs(
                                    widget.singleEvento.getIdEvento(),
                                  ),
                                ),
                              },
                              child: const Text("Modifica Evento",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white)),
                              fillColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  height: 50.0, width: 200),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    floatingActionButton: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _iscrizioneEvento()!,
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: RawMaterialButton(
                            onPressed: () => {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomePage.routeName,
                                arguments: const HomePage(),
                                ModalRoute.withName(HomePage.routeName),
                              ),
                            },
                            child: const Text("Home",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white)),
                            fillColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            constraints: BoxConstraints.tightFor(
                                height: 50.0, width: 150),
                          ),
                        ),
                      ],
                    ),
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text("Riepilogo Evento"),
                      backgroundColor: Colors.teal,
                    ),
                    body: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  widget.singleEvento.getNome(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Data: " +
                                      widget.singleEvento.getDataString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Inizia alle: " +
                                      widget.singleEvento
                                          .getOrarioInizioString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Iscritti: " +
                                      widget.singleEvento
                                          .getNumeroPartecipanti()
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
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
