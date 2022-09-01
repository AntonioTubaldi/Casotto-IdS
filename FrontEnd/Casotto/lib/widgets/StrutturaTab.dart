import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleStrutturaArgs.dart';
import '../models/Struttura.dart';
import '../views/SingleStruttura.dart';

class StrutturaTabView extends StatelessWidget {
  const StrutturaTabView({Key? key, required this.singleStruttura})
      : super(key: key);

  final Struttura singleStruttura;

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
            SingleStrutturaView.routeName,
            arguments: SingleStrutturaArgs(singleStruttura),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ' + singleStruttura.getNome(),
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stato: ' + singleStruttura.getStatoStrutturaString(),
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
