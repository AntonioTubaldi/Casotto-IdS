import 'dart:convert';
import 'package:casotto/models/Attrezzatura.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AttrezzaturaService {


final String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/attrezzatura";

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
}