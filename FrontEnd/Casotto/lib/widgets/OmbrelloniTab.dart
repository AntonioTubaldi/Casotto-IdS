import 'package:casotto/models/Ombrellone.dart';
import 'package:flutter/material.dart';

import '../views/SingleOmbrellone.dart';

class OmbrelloniTab extends StatelessWidget {
  const OmbrelloniTab({Key? key, required this.child}) : super(key: key);

  final Ombrellone child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        child: ElevatedButton.icon(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SingleOmbrelloneView(ombrellone: child)))
          },
          icon: Icon(
            Icons.beach_access,
            color: Colors.orange,
            size: 50.0,
          ),
          label: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fila: ' + child.getPosizione().toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Prezzo: ' + child.getPrezzo().toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
