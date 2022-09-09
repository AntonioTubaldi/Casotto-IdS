import 'package:casotto/models/Ordine.dart';
import 'package:flutter/material.dart';

import '../arguments/SingleOrdineArgs.dart';
import '../views/SingleOrdine.dart';

class OrdiniTab extends StatelessWidget {
  const OrdiniTab({Key? key, required this.child}) : super(key: key);

  final Ordine child;

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
            SingleOrdineView.routeName,
            arguments: SingleOrdineArgs(child),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ' + child.getIdOrdine(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stato: ' + child.getStatoString(),
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
