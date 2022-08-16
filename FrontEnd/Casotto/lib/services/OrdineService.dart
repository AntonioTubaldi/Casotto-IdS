
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/Ordine.dart';
import '../models/Prodotto.dart';

class OrdineService {

  final String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/ordine";

  // GET ALL ORDINI

  Future<List<Prodotto>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Prodotto> toReturn = [];

    for (var ordineObject in responseBody) {
     /* String idOrdine = ordineObject["idOrdine"];
      String idUtente = ordineObject["idUtente"];
      double costoTotale = ordineObject["costoTotale"];*/
      List<Prodotto> prodotti = ordineObject["prodottiOrdinati"];

      Prodotto ordineToAdd = Ordine(prodotti) as Prodotto;

      toReturn.add(ordineToAdd);
    }

    return toReturn;

  }

// ADD ORDINE

  Future<bool> addOrdine( List<Prodotto> prodotti) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode({
          /*"idOrdine": idOrdine,
          "idUtente": idUtente,
          "costoTotale": costoTotale,*/
          "prodottiOrdinati": prodotti
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  //  CONFERMA ORDINAZIONE

  Future<bool> confermaOrdine(String idOrdine) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/conferma/" + idOrdine);
    Response response = await http.put(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

}