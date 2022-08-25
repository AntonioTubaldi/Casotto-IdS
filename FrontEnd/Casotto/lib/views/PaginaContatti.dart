import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

class PaginaContattiView extends StatelessWidget {
  const PaginaContattiView({Key? key}) : super(key: key);

  static const String routeName = "PaginaContatti";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar:
         BottomAppBar(
           color: Colors.white,
          child: Row(
            children: [
              IconButton(icon: Icon(color:Colors.white ,Icons.menu), onPressed: () {}),

              const Spacer(),
            ],
          ),
        ),
        floatingActionButton:
        FloatingActionButton(child: Icon(color: Colors.teal, Icons.home),
            backgroundColor: Colors.white,
            onPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName(HomePage.routeName),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Text("Progetto: "),
                    title: Text(
                      '     CASOTTO',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  width: 150.0,
                ),
                  Text(
                  'TIZIANO',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade50,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade50,
                  ),
                ),
                Text(
                  'ANTONIO',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade50,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade50,
                  ),
                ),
                Text(
                  'GIANMARCO',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade50,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
                SizedBox(
                  height: 80.0,
                  width: 150.0,

                ),
                Text(
                  'Gruppo: GTA',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade50,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+39 333 56 86 133',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Itasolid95@gmail.com',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro'),
                      ),
                    ),),*/
              ],
            ),
        ),
      ),
    );

  }
}
