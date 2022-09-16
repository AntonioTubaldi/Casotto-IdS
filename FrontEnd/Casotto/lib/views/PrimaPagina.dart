import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'LoginAddettoSpiaggia.dart';
import 'LoginGestore.dart';
import 'LoginUtente.dart';

class PrimaPaginaView extends StatelessWidget {
  const PrimaPaginaView({Key? key}) : super(key: key);

  static const String routeName = "PrimaPagina";

  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser != null)
        ? HomePage()
        : Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: const Text("Benvenuto in Casotto!")),
            body: Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      fillColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      constraints:
                          BoxConstraints.tightFor(height: 40.0, width: 170),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginUtenteView.routeName,
                        );
                      },
                      child: Text("Login Utente",
                          style: TextStyle(color: Colors.white)),
                    ),
                    RawMaterialButton(
                      fillColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      constraints:
                          BoxConstraints.tightFor(height: 40.0, width: 170),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginGestoreView.routeName,
                        );
                      },
                      child: Text("Login Gestore",
                          style: TextStyle(color: Colors.white)),
                    ),
                    RawMaterialButton(
                      fillColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      constraints:
                          BoxConstraints.tightFor(height: 40.0, width: 170),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginAddettoSpiaggiaView.routeName,
                        );
                      },
                      child: Text(
                        "Login Addetto Spiaggia",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
