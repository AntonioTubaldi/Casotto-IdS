import 'dart:convert';

import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/models/StatoPrenotazione.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/Giorno.dart';
import '../models/SlotData.dart';

class PrenotazioneService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/prenotazione";

  Future<List<Prenotazione>> getPrenotazioneByData(DateTime data) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/data");

    Response response = await http.post(
      url,
      body: jsonEncode({"data": data.toIso8601String()}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    dynamic responseBody = jsonDecode(response.body);

    List<Prenotazione> toReturn = [];

    for (var prenotazioneObject in responseBody) {
      String? idPrenotazione = prenotazioneObject["idPrenotazione"];
      String? idUtente = prenotazioneObject["idUtente"];
      String? idOmbrellone = prenotazioneObject["idOmbrellone"];
      double? costoTotale = prenotazioneObject["costoTotale"];
      List<SlotData> dataToReturn = [];
      for (var dataObject in prenotazioneObject["dataPrenotazione"]) {
        Giorno durata = Giorno.values.firstWhere(
            (e) => e.toString() == "Giorno." + dataObject["durata"]);
        DateTime data = DateTime.parse(dataObject["data"]);

        SlotData slotDataToAdd = SlotData(durata, data);
        dataToReturn.add(slotDataToAdd);
      }
      StatoPrenotazione stato = StatoPrenotazione.values.firstWhere((e) =>
          e.toString() ==
          "StatoPrenotazione." + prenotazioneObject["statoPrenotazione"]);

      Prenotazione prenotazioneToAdd = Prenotazione(idPrenotazione!, idUtente!,
          idOmbrellone!, costoTotale!, dataToReturn, stato);

      toReturn.add(prenotazioneToAdd);
    }

    return toReturn;
  }

  Future<bool> confermaPrenotazione(String idPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/conferma/" + idPrenotazione);
    Response response = await http.put(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> eliminaPrenotazione(String idPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/delete/" + idPrenotazione);
    Response response = await http.delete(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> addPrenotazione(String idUtente, String idOmbrellone,
      List<SlotData> dataPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    print(jsonEncode({
      "idUtente": idUtente,
      "idOmbrellone": idOmbrellone,
      "dataPrenotazione": dataPrenotazione
          .map((slotData) => {
                "durata": slotData.getDurataString(),
                "data": slotData.getData().toIso8601String()
              })
          .toList()
    }));
    Response response = await http.post(
      url,
      body: jsonEncode({
        "idUtente": idUtente,
        "idOmbrellone": idOmbrellone,
        "dataPrenotazione": dataPrenotazione
            .map((slotData) => {
                  "durata": slotData.getDurataString(),
                  "data": slotData.getData().toIso8601String()
                })
            .toList()
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
