import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:casotto/widgets/PrenotazioniTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllPrenotazioniView extends StatefulWidget {
  AllPrenotazioniView({Key? key, required this.dataSelezionata})
      : super(key: key);
  DateTime dataSelezionata;

  @override
  State<AllPrenotazioniView> createState() => _AllPrenotazioniViewState();
}

class _AllPrenotazioniViewState extends State<AllPrenotazioniView> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  List<Widget> _getPrenotazioniTabs(List<Prenotazione> prenotazioni) {
    return prenotazioni.map((Prenotazione singlePrenotazione) {
      return PrenotazioniTab(prenotazione: singlePrenotazione);
    }).toList();
  }

  Widget _getScrollableView(List<Prenotazione> prenotazioneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getPrenotazioniTabs(prenotazioneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Prenotazione>>(
      future:
          _prenotazioneService.getPrenotazioneByData(widget.dataSelezionata),
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
              List<Prenotazione> list = snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Visualizza Prenotazioni'),
                ),
                body: _getScrollableView(list),
              );
            }
        }

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
