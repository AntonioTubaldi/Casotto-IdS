import 'dart:convert';

import 'package:casotto/models/StatoOrdine.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/Ordine.dart';
import '../models/Prodotto.dart';

class OrdineService {
  final String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/ordine";

  // GET ALL ORDINI

  Future<List<Ordine>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Ordine> toReturn = [];

    for (var ordineObject in responseBody) {
      String idOrdine = ordineObject["idOrdine"];
      String idUtente = ordineObject["idUtente"];
      double costoTotale = ordineObject["costoTotale"];
      List<Prodotto> prodottiToReturn = [];
      for (var prodottoObject in ordineObject["prodotti"]) {
        String nome = prodottoObject["nome"];
        double prezzo = prodottoObject["prezzo"];

        Prodotto prodottoToAdd = Prodotto(nome, prezzo);
        prodottiToReturn.add(prodottoToAdd);
      }
      StatoOrdine stato = StatoOrdine.values.firstWhere(
          (e) => e.toString() == "StatoOrdine." + ordineObject["stato"]);
      print(stato);

      Ordine ordineToAdd =
          Ordine(idOrdine, idUtente, costoTotale, prodottiToReturn, stato);

      toReturn.add(ordineToAdd);
    }

    return toReturn;
  }

// ADD ORDINE

  Future<bool> addOrdine(
      String idUtente, double costoTotale, List<Prodotto> prodotti) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(
      url,
      body: jsonEncode(
        {
          "idUtente": idUtente,
          "costoTotale": costoTotale,
          "prodotti": prodotti
              .map(
                (prodotto) => {
                  "nome": prodotto.getNome(),
                  "prezzo": prodotto.getPrezzo(),
                },
              )
              .toList(),
        },
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

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
