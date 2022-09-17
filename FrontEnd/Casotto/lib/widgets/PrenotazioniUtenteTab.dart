import 'package:casotto/models/Prenotazione.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SinglePrenotazioneViewArgs.dart';
import '../views/SinglePrenotazioneUtente.dart';

class PrenotazioniUtenteTab extends StatelessWidget {
  const PrenotazioniUtenteTab({Key? key, required this.singlePrenotazione})
      : super(key: key);

  final Prenotazione singlePrenotazione;

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
            SinglePrenotazioneUtenteView.routeName,
            arguments: SinglePrenotazioneViewArgs(singlePrenotazione),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prenotazione ' + singlePrenotazione.getStatoPrenotazioneString(),
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
