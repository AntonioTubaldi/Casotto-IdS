import 'dart:convert';

import 'package:casotto/models/ParametriPrenotazione.dart';
import 'package:casotto/models/Prenotazione.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/SlotData.dart';

class PrenotazioneService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/prenotazione";

  Future<List<Prenotazione>> getPrenotazioneByData(DateTime data) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/data");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Prenotazione> toReturn = [];

    for (var prenotazioneObject in responseBody) {
      String? idPrenotazione = prenotazioneObject["idPrenotazione"];
      String? idUtente = prenotazioneObject["idUtente"];
      String? idOmbrellone = prenotazioneObject["idOmbrellone"];
      double? costoTotale = prenotazioneObject["costoTotale"];
      List<SlotData>? dataPrenotazione = prenotazioneObject["dataPrenotazione"];

      Prenotazione prenotazioneToAdd = Prenotazione(idPrenotazione!, idUtente!,
          idOmbrellone!, costoTotale!, dataPrenotazione!);
      toReturn.add(prenotazioneToAdd);
    }

    return toReturn;
  }

  Future<bool> confermaPrenotazione(String idPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/conferma/" + idPrenotazione);
    Response response = await http.put(url);
    dynamic responseBody = response.body;
    return responseBody;
  }

  Future<bool> eliminaPrenotazione(String idPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/delete/" + idPrenotazione);
    Response response = await http.delete(url);
    dynamic responseBody = response.body;
    return responseBody;
  }

  Future<bool> addPrenotazione(ParametriPrenotazione p) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url);
    dynamic responseBody = response.body;
    return responseBody;
  }
}
