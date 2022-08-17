import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllOrdini.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        /**
         * per visualizzare il background, andare su 
         * pubspec.yaml ->  assets:
                          - .env
                          - lib/images/

        sotto .env aggiungere -lib/images/
         */
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/spiaggia.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      AllOmbrelloniView.routeName,
                    ),
                  },
                  child: const Text(
                    "VISUALIZZA SPIAGGIA",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 350),
                ),
                RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      CalendarView.routeName,
                    ),
                  },
                  child: Text("VISUALIZZA PRENOTAZIONI",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 350),
                ),
                RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      MenuView.routeName,
                    ),
                  },
                  child: const Text(
                    "VISUALIZZA MENU",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 350),
                ),
                RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      AllOrdiniView.routeName,
                    ),
                  },
                  child: const Text(
                    "VISUALIZZA ORDINI",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 350),
                ),
                RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      PaginaContattiView.routeName,
                    ),
                  },
                  child: const Text(
                    "VISUALIZZA PAGINA CONTATTI",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 350),
                ),
              ], // children
            ),
          ),
        ));
  }
}
