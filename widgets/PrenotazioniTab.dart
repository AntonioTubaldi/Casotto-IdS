import 'package:casotto/arguments/SinglePrenotazioneViewArgs.dart';
import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/views/SinglePrenotazione.dart';
import 'package:flutter/material.dart';

class PrenotazioniTab extends StatelessWidget {
  const PrenotazioniTab({Key? key, required this.child}) : super(key: key);

  final Prenotazione child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            SinglePrenotazioneView.routeName,
            arguments: SinglePrenotazioneViewArgs(child),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ' + child.getIdPrenotazione(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stato: ' + child.getStatoPrenotazioneString(),
              style: TextStyle(
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
