import 'dart:convert';
import 'dart:core';
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
      String? idOmbrellone = ombrelloneObject["idOmbrellone"];
      double? prezzo = ombrelloneObject["prezzo"];
      int? posizione = ombrelloneObject["posizione"];
      List<SlotData>? disponibilita = ombrelloneObject["disponibilita"];

      Ombrellone ombrelloneToAdd =
          Ombrellone(idOmbrellone!, prezzo!, posizione!, disponibilita!);
      toReturn.add(ombrelloneToAdd);
    }

    return toReturn;
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

      Ombrellone ombrelloneToAdd =
          Ombrellone(idOmbrellone!, prezzo!, posizione!, disponibilita!);
      toReturn.add(ombrelloneToAdd);
    }

    return toReturn;
  }
}
