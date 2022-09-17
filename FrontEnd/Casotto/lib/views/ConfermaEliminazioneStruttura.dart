import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleStrutturaArgs.dart';
import '../models/Struttura.dart';
import 'EliminaStruttura.dart';
import 'HomePage.dart';

class ConfermaEliminazioneStrutturaView extends StatefulWidget {
  const ConfermaEliminazioneStrutturaView(
      {Key? key, required this.singleStruttura})
      : super(key: key);

  final Struttura singleStruttura;
  static const String routeName = "ConfermaEliminazioneStruttura";

  @override
  State<ConfermaEliminazioneStrutturaView> createState() =>
      _ConfermaEliminazioneStrutturaViewState();
}

class _ConfermaEliminazioneStrutturaViewState
    extends State<ConfermaEliminazioneStrutturaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Eliminazione struttura"),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Stai per eliminare la seguente struttura: "),
            Text(
              widget.singleStruttura.getNome(),
            ),
            Text(
              "Sei sicuro?",
              style: TextStyle(color: Colors.white),
            ),
            RawMaterialButton(
              fillColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  EliminaStrutturaView.routeName,
                  arguments: SingleStrutturaArgs(widget.singleStruttura),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
