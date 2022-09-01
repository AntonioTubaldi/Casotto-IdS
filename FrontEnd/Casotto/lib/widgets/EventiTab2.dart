import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Evento.dart';

class EventiTab2View extends StatelessWidget {
  const EventiTab2View({Key? key, required this.singleEvento})
      : super(key: key);

  final Evento singleEvento;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton.icon(
        onPressed: () => {},
        icon: const Icon(
          Icons.event,
          color: Colors.orange,
          size: 50.0,
        ),
        label: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${singleEvento.getNome()}',
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Data: ${singleEvento.getDataString()}',
              style: const TextStyle(
                fontSize: 28,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Orario di inizio: ${singleEvento.getOrarioInizioString()}',
              style: const TextStyle(
                fontSize: 28,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
