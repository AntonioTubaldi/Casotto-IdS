import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AllOmbrelloni.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "Homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text('HomePage'),
        ),
        // ALT + INVIO per fare il wrap del widget all'interno di un altro widget (una colonna o una riga)
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/spiaggia2.jpg"),
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
                  fillColor: Colors.blue,
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
                  fillColor: Colors.blue,
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
