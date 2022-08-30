import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/OmbrelloneStringArg.dart';
import '../models/Ombrellone.dart';
import 'HomePage.dart';
import 'RimuoviOmbrellone.dart';

class ConfermaEliminazioneView extends StatefulWidget {
  const ConfermaEliminazioneView({Key? key, required this.singleOmbrellone})
      : super(key: key);

  final Attrezzatura singleOmbrellone;

  static const String routeName = "ConfermaEliminazione";

  @override
  State<ConfermaEliminazioneView> createState() =>
      _ConfermaEliminazioneViewState();
}

class _ConfermaEliminazioneViewState extends State<ConfermaEliminazioneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliminazione ombrellone"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Stai per eliminare il seguente ombrellone: "),
          Text(
            widget.singleOmbrellone.getIdOmbrellone(),
          ),
          Text("Sei sicuro?"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RimuoviOmbrelloneView.routeName,
                arguments: OmbrelloneStringArg(
                  widget.singleOmbrellone.getIdOmbrellone(),
                ),
                ModalRoute.withName(HomePage.routeName),
              );
            },
            child: Text("CONFERMA"),
          )
        ],
      )),
    );
  }
}
