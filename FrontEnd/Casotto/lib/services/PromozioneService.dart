import 'dart:convert';

import 'package:casotto/models/Promozione.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class PromozioneService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/promozione";

  Future<List<Promozione>> getAll() async {
    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Promozione> toReturn = [];

    for (var promozioneObject in responseBody) {
      String idPromozione = promozioneObject["idPromozione"];
      String idProdotto = promozioneObject["idProdotto"];
      double originalPrezzo = promozioneObject["originalPrezzo"];
      double newPrezzo = promozioneObject["newPrezzo"];

      Promozione promozioneToAdd =
          Promozione(idPromozione, idProdotto, originalPrezzo, newPrezzo);

      toReturn.add(promozioneToAdd);
    }

    return toReturn;
  }

  Future<bool> addPromozione(String idProdotto, double newPrezzo) async {
    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode({
          "idProdotto": idProdotto,
          "newPrezzo": newPrezzo,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> modificaPromozione(String idPromozione, double newPrezzo) async {
    Uri url = Uri.parse(
        _baseUrl + "/modifica/" + idPromozione + "/" + newPrezzo.toString());
    Response response = await http.put(url);

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> rimuoviPromozione(String idPromozione) async {
    Uri url = Uri.parse(_baseUrl + "/delete/" + idPromozione);
    Response response = await http.delete(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
