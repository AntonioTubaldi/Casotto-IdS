import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class UtenteService{

  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/utente";

  Future<bool> _iscrizioneEvento(String idUtente, String idEvento)async{

    Uri url = Uri.parse(_baseUrl + "/iscrizione"+idUtente+idEvento);
    Response response = await http.put(url);
    bool responseBody = jsonDecode(response.body) as bool;

    return responseBody;

  }

}