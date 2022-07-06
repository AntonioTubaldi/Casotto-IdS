import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: ButtonTheme(
          minWidth: 300.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllOmbrelloniView()))
            },
            child: Text(
              "VISUALIZZA SPIAGGIA",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
