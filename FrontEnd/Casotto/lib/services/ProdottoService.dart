import 'dart:convert';

import 'package:casotto/models/Prodotto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProdottoService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/prodotto";

  Future<List<Prodotto>> getAll() async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Prodotto> toReturn = [];

    for (var prodottoObject in responseBody) {
      String nome = prodottoObject["nome"];
      double prezzo = prodottoObject["prezzo"];

      Prodotto prodottoToAdd = Prodotto(nome, prezzo);

      toReturn.add(prodottoToAdd);
    }

    return toReturn;
  }

  Future<bool> addProdotto(String nome, double prezzo) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode({
          "nome": nome,
          "prezzo": prezzo,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<void> rimuoviProdotto(String nome) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/delete/" + nome);
    Response response = await http.delete(url);
    dynamic responseBody = response.body;
  }

  Future<bool> modificaProdotto(String nome, double prezzo) async {
    await Future.delayed(Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/modifica/" + nome);
    Response response = await http.put(
      url,
      body: jsonEncode(
        {
          "prezzo": prezzo,
        },
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
