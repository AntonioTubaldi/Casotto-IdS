import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

class PaginaContattiView extends StatelessWidget {
  const PaginaContattiView({Key? key}) : super(key: key);

  static const String routeName = "PaginaContatti";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Contatti"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(HomePage.routeName),
            );
          },
          child: Text("Home")),
      body: Center(
          child: Column(
        children: [
          Text("Gianmarco"),
          Text("Tiziano"),
          Text("Antonio"),
          Text("Nome Progetto: CASOTTO"),
          Text("Gruppo Progetto: GTA"),
        ],
      )),
    );
  }
}
