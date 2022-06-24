import 'dart:convert';
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
