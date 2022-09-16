import 'package:casotto/services/UtenteService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class AbilitazioneQRCodeView extends StatefulWidget {
  const AbilitazioneQRCodeView({Key? key}) : super(key: key);

  static const String routeName = "AbilitazioneQRCode";

  @override
  State<AbilitazioneQRCodeView> createState() => _AbilitazioneQRCodeViewState();
}

class _AbilitazioneQRCodeViewState extends State<AbilitazioneQRCodeView> {
  UtenteService utenteService = new UtenteService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: utenteService.setRuolo(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const MessageScreen(status: MessageScreenStatus.LOADING);
          case ConnectionState.none:
            return const MessageScreen(status: MessageScreenStatus.ERROR);
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const MessageScreen(status: MessageScreenStatus.ERROR);
            } else {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Abilitazione effettuata'),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: const Text(
                        "Ora sei abilitato",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    RawMaterialButton(
                      fillColor: Colors.teal,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          arguments: const HomePage(),
                          ModalRoute.withName(HomePage.routeName),
                        );
                      },
                      child: const Text("AVANTI",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
