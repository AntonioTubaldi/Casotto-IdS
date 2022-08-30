import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../arguments/SingleAttrezzaturaViewArgs.dart';
import '../models/Attrezzatura.dart';
import '../views/SingleAttrezzatura.dart';

class AttrezzatureTab extends StatelessWidget {
  const AttrezzatureTab({Key? key, required this.singleAttrezzatura})
      : super(key: key);

  final Attrezzatura singleAttrezzatura;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton.icon(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            SingleAttrezzaturaView.routeName,
            arguments: SingleAttrezzaturaViewArgs(singleAttrezzatura),
          ),
        },
        icon: const Icon(
          Icons.build,
          color: Colors.orange,
          size: 50.0,
        ),
        label: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${singleAttrezzatura.getNome()}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Quantità: ${singleAttrezzatura.getQuantita()}',
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
