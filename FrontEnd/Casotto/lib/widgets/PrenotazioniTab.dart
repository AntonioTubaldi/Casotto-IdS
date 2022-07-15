import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:casotto/views/ConfermaPrenotazione.dart';
import 'package:casotto/views/EliminaPrenotazione.dart';
import 'package:casotto/widgets/SelectablePrenotazioniTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrenotazioniTab extends StatefulWidget {
  const PrenotazioniTab({Key? key, required this.prenotazione})
      : super(key: key);
  final Prenotazione prenotazione;

  @override
  State<PrenotazioniTab> createState() => _SinglePrenotazioneViewState();
}

class _SinglePrenotazioneViewState extends State<PrenotazioniTab> {
  Set<Prenotazione> _datiSelezionati = Set();

  Widget _getSlotPrenotazioniTabs(Prenotazione daMostrare) {
    return SelectablePrenotazioniTab(
      child: daMostrare,
      isActivated: _datiSelezionati.contains(daMostrare),
      onPressed: () => {
        setState(() => {
              if (_datiSelezionati.contains(daMostrare))
                {_datiSelezionati.remove(daMostrare)}
              else
                {_datiSelezionati.add(daMostrare)}
            })
      },
    );
  }

  /* Widget _getScrollableView(Prenotazione prenotazione) {
    return SingleChildScrollView(
      child: Center(
        child: _getSlotPrenotazioniTabs(prenotazione),
      ),
    );
  }
  */

  Widget? _confermaPrenotazione() {
    String aperta = "APERTA";
    String confermata = "CONFERMATA";
    if (_datiSelezionati.isNotEmpty &
        widget.prenotazione.getStatoPrenotazioneString().contains(aperta)) {
      return Center(
          child: ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfermaPrenotazione(
                                  id: widget.prenotazione.getIdPrenotazione(),
                                )))
                  },
              child: Text(
                "CONFERMA",
                style: TextStyle(fontSize: 20),
              )));
    } else if (_datiSelezionati.isNotEmpty &
        widget.prenotazione.getStatoPrenotazioneString().contains(confermata)) {
      return Center(
          child: ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EliminaPrenotazione(
                                  id: widget.prenotazione.getIdPrenotazione(),
                                )))
                  },
              child: Text(
                "ELIMINA",
                style: TextStyle(fontSize: 20),
              )));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _confermaPrenotazione(),
      appBar: AppBar(title: Text("Riepilogo Prenotazioni")),
      body: Center(
        child: _getSlotPrenotazioniTabs(widget.prenotazione),
      ),
    );
  }
}
