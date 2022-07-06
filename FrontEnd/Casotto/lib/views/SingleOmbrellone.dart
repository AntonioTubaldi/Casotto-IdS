import 'package:casotto/models/Ombrellone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleOmbrelloneView extends StatelessWidget {
  const SingleOmbrelloneView({Key? key, required this.ombrellone})
      : super(key: key);

  final Ombrellone ombrellone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Id: ${ombrellone.getIdOmbrellone()}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Fila: ${ombrellone.getPosizione()}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Prezzo: ${ombrellone.getPrezzo()}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
