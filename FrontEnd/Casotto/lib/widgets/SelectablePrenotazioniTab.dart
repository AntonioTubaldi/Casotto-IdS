import 'package:casotto/models/Prenotazione.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectablePrenotazioniTab extends StatelessWidget {
  const SelectablePrenotazioniTab(
      {Key? key,
      required this.child,
      required this.isActivated,
      required this.onPressed})
      : super(key: key);

  final Prenotazione child;
  final bool isActivated;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: isActivated ? Colors.blue : Colors.grey),
      onPressed: onPressed,
      child: Text(
        child.getDataPrenotazione().toString() +
            child.getStatoPrenotazioneString(),
        maxLines: 2,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
