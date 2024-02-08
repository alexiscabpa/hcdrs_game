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
      //print(key);
    });

    isLoading = false;
    notifyListeners();
    return enigmas;
  }

  Future saveGanador(Enigma enigma) async {
    notifyListeners();

    Future<String> updateEnigma(Enigma enigma) async {
      final url = Uri.https(_baseUrl, 'postas/xx11.json');
      final resp = await http.put(url, body: enigma.toJson());
      final decodedData = resp.body;
      //print(decodedData);

      //******Actualizacion del listado de productos metodo tradicional********************

      /*for (int i = 0; i < products.length; i++) {
       if (products[i].id == product.id) {
          products[i] = product;
          //print('mostrando el listado del tema: ${product.toJson()}');
          break;
        }
      }
*****************************************************************************************/

      //*********Otro metodo mas eficiente para encontrar el id del producto**************
      final index = enigmas.indexWhere((element) => element.id == enigma.id);
      enigmas[index] = enigma;

      return enigma.id!;
    }

    //***************************************************************************

    // actualizar
    await updateEnigma(enigma);

    notifyListeners();
  }
}
