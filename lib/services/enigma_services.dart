import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class EnigmaService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-6e212-default-rtdb.firebaseio.com';
  final List<Enigma> enigmas = [];
  bool isLoading = true;

  EnigmaService() {
    this.loadEnigmas();
  }

//TODO: <List<Enigma>>
  Future loadEnigmas() async {
    isLoading = true;
    notifyListeners(); //Para que notifique a cualquier Widget con el que quiero trabajar
    final url = Uri.https(_baseUrl, 'postas.json');

    final resp = await http.get(url);

    final Map<String, dynamic> enigmasMap = json.decode(resp.body);

    enigmasMap.forEach((key, value) {
      final tempEnigma = Enigma.fromMap(value);
      tempEnigma.id = key;
      enigmas.add(tempEnigma);
      print(key);
    });

    isLoading = false;
    notifyListeners();
    return enigmas;
  }
}
