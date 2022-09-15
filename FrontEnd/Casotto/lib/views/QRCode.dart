import 'package:casotto/views/AbilitazioneQRCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

class QRCodeView extends StatelessWidget {
  const QRCodeView({Key? key}) : super(key: key);

  static const String routeName = "QRCode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(color: Colors.teal, Icons.home),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.teal,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AbilitazioneQRCodeView.routeName,
              ModalRoute.withName(HomePage.routeName),
            );
          },
          child: Text("Inquadra il QRCode"),
        ),
      ),
    );
  }
}
