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
        title: Text("Eliminazione struttura"),
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
            Text("Stai per eliminare la seguente struttura: "),
            Text(
              widget.singleStruttura.getNome(),
            ),
            Text("Sei sicuro?"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  EliminaStrutturaView.routeName,
                  arguments: SingleStrutturaArgs(widget.singleStruttura),
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
