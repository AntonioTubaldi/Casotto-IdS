import 'dart:convert';
import 'package:casotto/models/Attrezzatura.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AttrezzaturaService {
  final String _baseUrl =
      dotenv.env["BACKEND_URL"].toString() + "/attrezzatura";

  Future<List<Attrezzatura>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Attrezzatura> toReturn = [];

    for (var attrezzaturaObject in responseBody) {
      String nome = attrezzaturaObject["nome"];
      int quantita = attrezzaturaObject["quantita"];

      Attrezzatura attrezzaturaToAdd = Attrezzatura(nome, quantita);

      toReturn.add(attrezzaturaToAdd);
    }

    return toReturn;
  }

  Future<bool> addAttrezzatura(String nome, int quantita) async {
    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode(
          {"nome": nome, "quantita": quantita},
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> modificaAttrezzatura(String nome, int newQuantita) async {
    Uri url = Uri.parse(_baseUrl + "/modifica/" + nome);
    Response response = await http.put(
      url,
      body: jsonEncode(
        {
          "quantita": newQuantita,
        },
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> rimuoviAttrezzatura(String nome) async {
    Uri url = Uri.parse(_baseUrl + "/delete/" + nome);
    Response response = await http.delete(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
