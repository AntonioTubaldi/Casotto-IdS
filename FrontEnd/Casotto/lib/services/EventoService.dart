import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../models/Evento.dart';
import 'package:http/http.dart' as http;

class EventoService {
  final String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/evento";

  Future<List<Evento>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Evento> toReturn = [];

    for (var eventoObject in responseBody) {
      String idEvento = eventoObject["idEvento"];
      String nome = eventoObject["nome"];
      DateTime data = DateTime.parse(eventoObject["data"]);
      TimeOfDay orarioInizio = eventoObject["orarioInizio"];
      int numeroMaxPartecipanti = eventoObject["numeroMaxPartecipanti"];
      int numeroPartecipanti = eventoObject["numeroPartecipanti"];

      Evento eventoToAdd = Evento(idEvento, nome, data, orarioInizio,
          numeroMaxPartecipanti, numeroPartecipanti);

      toReturn.add(eventoToAdd);
    }

    return toReturn;
  }
}
