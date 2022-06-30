import 'package:casotto/models/Ombrellone.dart';
import 'package:flutter/material.dart';

class OmbrelloniTab extends StatelessWidget {
  const OmbrelloniTab({Key? key, required this.child}) : super(key: key);

  final Ombrellone child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Fila: ${child.getPosizione().toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Prezzo: ${child.getPrezzo().toString()}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ));
  }
}
