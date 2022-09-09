import 'package:casotto/models/Utente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleUtenteArgs.dart';
import '../views/SingleUtente.dart';

class UtenteTab extends StatelessWidget {
  const UtenteTab({Key? key, required this.singleUtente}) : super(key: key);

  final Utente singleUtente;

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
            SingleUtenteView.routeName,
            arguments: SingleUtenteArgs(singleUtente),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ' + singleUtente.getNome(),
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Congome: ' + singleUtente.getCognome(),
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
