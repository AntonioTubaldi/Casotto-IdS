import 'dart:convert';

import 'package:casotto/models/StatoStruttura.dart';
import 'package:casotto/models/Struttura.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:enum_to_string/enum_to_string.dart';

class StrutturaService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/struttura";

  Future<List<Struttura>> getAll() async {
    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Struttura> toReturn = [];

    for (var strutturaObject in responseBody) {
      String idStruttura = strutturaObject["idStruttura"];
      String nome = strutturaObject["nome"];
      StatoStruttura stato = StatoStruttura.values.firstWhere(
          (e) => e.toString() == "StatoStruttura." + strutturaObject["stato"]);

      Struttura strutturaToAdd = Struttura(idStruttura, nome, stato);

      toReturn.add(strutturaToAdd);
    }

    return toReturn;
  }

  Future<bool> addStruttura(String nome, StatoStruttura stato) async {
    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode(
          {
            "nome": nome,
            "stato": EnumToString.convertToString(stato),
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> modificaStruttura(
      String idStruttura, String nome, StatoStruttura stato) async {
    Uri url = Uri.parse(_baseUrl + "/modifica/" + idStruttura);
    Response response = await http.put(url,
        body: jsonEncode(
          {
            "nome": nome,
            "stato": EnumToString.convertToString(stato),
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> rimuoviStruttura(String idStruttura) async {
    Uri url = Uri.parse(_baseUrl + "/delete/" + idStruttura);
    Response response = await http.delete(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
