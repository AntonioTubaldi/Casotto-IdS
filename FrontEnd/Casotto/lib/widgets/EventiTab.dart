import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Evento.dart';

class EventiTab extends StatelessWidget {
  const EventiTab({Key? key, required this.singleEvento}) : super(key: key);

  final Evento singleEvento;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton.icon(
        onPressed: () => {

        },
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
              'nome: ${singleEvento.getNome()}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Data: ${singleEvento.getData()}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Orario di inizio: ${singleEvento.getOrarioInizio()}',
              style: const TextStyle(
                fontSize: 30,
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
