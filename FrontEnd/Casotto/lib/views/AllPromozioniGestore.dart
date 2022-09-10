import 'package:casotto/models/Promozione.dart';
import 'package:casotto/services/PromozioneService.dart';
import 'package:casotto/views/EliminaPromozione.dart';
import 'package:casotto/views/SinglePromozioneGestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/PromozioniTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';
import 'SceltaSpecifichePromozione.dart';

class AllPromozioniGestoreView extends StatefulWidget {
  const AllPromozioniGestoreView({Key? key}) : super(key: key);

  static const String routeName = "AllPromozioniGestore";

  @override
  State<AllPromozioniGestoreView> createState() =>
      _AllPromozioniGestoreViewState();
}

class _AllPromozioniGestoreViewState extends State<AllPromozioniGestoreView> {
  PromozioneService promozioneService = new PromozioneService();

  List<Widget> _getPromozioniTabs(List<Promozione> promozioni) {
    return promozioni.map((Promozione singlePromozione) {
      return PromozioniTab(singlePromozione: singlePromozione);
    }).toList();
  }

  Widget _getScrollableView(List<Promozione> promozioneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getPromozioniTabs(promozioneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Promozione>>(
      future: promozioneService.getAll(),
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
                List<Promozione> list = snapshot.data!;
                return Scaffold(
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.home),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              arguments: const HomePage(),
                              ModalRoute.withName(HomePage.routeName),
                            );
                          },
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.add),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SceltaSpecifichePromozioneView.routeName,
                            );
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Promozioni attive'),
                  ),
                  body: Column(
                    children: [
                      _getScrollableView(list),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text("Promozioni attive"),
                  ),
                  floatingActionButton: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: (() {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomePage.routeName,
                            arguments: const HomePage(),
                            ModalRoute.withName(HomePage.routeName),
                          );
                        }),
                        child: Text("HOME"),
                      ),
                    ],
                  ),
                  body: Center(
                    child: const Text("Non ci sono promozioni da mostrare"),
                  ),
                );
              }
            }
        }
        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
