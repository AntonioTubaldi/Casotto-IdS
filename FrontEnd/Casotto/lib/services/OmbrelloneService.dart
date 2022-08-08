import 'dart:convert';
import 'dart:core';
import 'package:casotto/models/Giorno.dart';
import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class OmbrelloneService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/ombrellone";

  Future<List<Ombrellone>> getAllOmbrelloni() async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Ombrellone> toReturn = [];

    for (var ombrelloneObject in responseBody) {
      String idOmbrellone = ombrelloneObject["idOmbrellone"];
      double prezzo = ombrelloneObject["prezzo"];
      int posizione = ombrelloneObject["posizione"];
      List<SlotData> dataToReturn = [];
      for (var dataObject in ombrelloneObject["disponibilita"]) {
        Giorno durata = Giorno.values.firstWhere(
            (e) => e.toString() == "Giorno." + dataObject["durata"]);
        DateTime data = DateTime.parse(dataObject["data"]);
        print(data);
        print(dataObject["data"]);
        SlotData slotDataToAdd = SlotData(durata, data);
        dataToReturn.add(slotDataToAdd);
      }

      double prezzoLettini = ombrelloneObject["prezzoLettini"];
      double prezzoSdraio = ombrelloneObject["prezzoSdraio"];

      Ombrellone ombrelloneToAdd = Ombrellone(idOmbrellone, prezzo, posizione,
          dataToReturn, prezzoLettini, prezzoSdraio);

      toReturn.add(ombrelloneToAdd);
    }
    return toReturn;
  }

  Future<bool> addOmbrellone(double prezzo, int posizione, double prezzoLettini,
      double prezzoSdraio) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode({
          "prezzo": prezzo,
          "posizione": posizione,
          "prezzoLettini": prezzoLettini,
          "prezzoSdraio": prezzoSdraio
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<void> rimuoviOmbrellone(String idOmbrellone) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/delete/" + idOmbrellone);
    Response response = await http.delete(url);
    dynamic responseBody = response.body;
  }

  Future<List<SlotData>> getDisponibilita(String idOmbrellone) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/disponibilita/" + idOmbrellone);
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<bool> addDisponibilita(
      String idOmbrellone, List<SlotData> disponibilitaToAdd) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/" + idOmbrellone);
    Response response = await http.put(url);
    dynamic responseBody = response.body;
    return responseBody;
  }

  Future<bool> rimuoviDisponibilita(
      String idOmbrellone, List<SlotData> dataPrenotazione) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/" + idOmbrellone);
    Response response = await http.delete(url);
    dynamic responseBody = response.body;
    return responseBody;
  }

  Future<List<Ombrellone>> addListOmbrellone(
      List<Ombrellone> newOmbrelloneList) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url);
    dynamic responseBody = jsonDecode(response.body);
    List<Ombrellone> toReturn = [];

    for (var ombrelloneObject in responseBody) {
      String? idOmbrellone = ombrelloneObject["id"];
      double? prezzo = ombrelloneObject["prezzo"];
      int? posizione = ombrelloneObject["posizione"];
      List<SlotData>? disponibilita = ombrelloneObject["disponibilita"];
      double prezzoLettini = ombrelloneObject["prezzoLettini"];
      double prezzoSdraio = ombrelloneObject["prezzoSdraio"];

      Ombrellone ombrelloneToAdd = Ombrellone(idOmbrellone!, prezzo!,
          posizione!, disponibilita!, prezzoLettini, prezzoSdraio);
      toReturn.add(ombrelloneToAdd);
    }

    return toReturn;
  }
}
