import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Evento.dart';
import '../services/EventoService.dart';
import '../widgets/EventiTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';


class AllEventiView extends StatefulWidget {
  const AllEventiView({Key? key}) : super(key: key);

  static const String routeName = "AllEventi";

  @override
  State<AllEventiView> createState() => _AllEventiViewState();
}

class _AllEventiViewState extends State<AllEventiView> {

  EventoService _eventoService = new EventoService();

  List<Widget> _getEventiTabs(List<Evento> evento) {
    return evento.map((Evento singleEvento) {
      return EventiTab(singleEvento: singleEvento);
    }).toList();
  }

  Widget _getScrollableView(List<Evento> eventoList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getEventiTabs(eventoList),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Evento>>(
      future: _eventoService.getAll(),
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
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                List<Evento> list = snapshot.data!;
                return Scaffold(

                  bottomNavigationBar:
                  BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [

                        const Spacer(),

                        IconButton(icon: Icon(color:Colors.teal ,Icons.home), onPressed: () {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName(HomePage.routeName),
                          );
                        }),

                        const Spacer(),

                        IconButton(icon: Icon(color:Colors.teal ,Icons.add), onPressed: () {

                        }),

                        const Spacer(),

                      ],
                    ),
                  ),

                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Eventi'),
                  ),

                  body: _getScrollableView(list),
                  floatingActionButton: Row(
                      children: [
                        SizedBox(width: 40.0),
                        Container(
                          child: RawMaterialButton(
                            onPressed: () => {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(HomePage.routeName),
                              ),
                            },
                          ),
                        ),
                      ]),
                );
              } else {
                return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Visualizza Eventi"),
                  ),
                  body: Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Non ci sono eventi disponibili!"),
                          ),
                          RawMaterialButton(
                            onPressed: () => {

                            },
                            child: Text("Aggiungi evento",
                                style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                            fillColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            constraints:
                            BoxConstraints.tightFor(height: 50.0, width: 200),
                          ),
                        ],
                      )),
                  bottomNavigationBar:
                  BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [

                        IconButton(icon: Icon(color:Colors.teal ,Icons.home), onPressed: () {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName(HomePage.routeName),
                          );
                        }),

                        const Spacer(),

                        IconButton(icon: Icon(color:Colors.teal ,Icons.add), onPressed: () {


                        }),
                      ],
                    ),
                  ),
                );
              }
            }
            return const MessageScreen(status: MessageScreenStatus.ERROR);
        }
      },
    );

  }
}
