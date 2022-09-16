import 'package:casotto/models/Attrezzatura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AttrezzaturaNomeArg.dart';
import 'EliminaAttrezzatura.dart';
import 'HomePage.dart';

class ConfermaEliminazioneAttrezzaturaView extends StatefulWidget {
  const ConfermaEliminazioneAttrezzaturaView(
      {Key? key, required this.singleAttrezzatura})
      : super(key: key);

  final Attrezzatura singleAttrezzatura;

  static const String routeName = "ConfermaEliminazioneAttrezzatura";

  @override
  State<ConfermaEliminazioneAttrezzaturaView> createState() =>
      _ConfermaEliminazioneAttrezzaturaViewState();
}

class _ConfermaEliminazioneAttrezzaturaViewState
    extends State<ConfermaEliminazioneAttrezzaturaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Eliminazione attrezzatura"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Stai per eliminare la seguente attrezzatura: "),
            Text(
              widget.singleAttrezzatura.getNome(),
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
                  EliminaAttrezzaturaView.routeName,
                  arguments: AttrezzaturaNomeArg(
                    widget.singleAttrezzatura.getNome(),
                  ),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA"),
            ),
          ],
        ),
      ),
    );
  }
}
