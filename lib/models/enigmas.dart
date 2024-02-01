import 'dart:convert';

class Enigma {
  String ayuda;
  String obs;
  String respuesta;
  String sobre;
  String? id;

  Enigma(
      {required this.ayuda,
      required this.obs,
      required this.respuesta,
      required this.sobre,
      this.id});

  factory Enigma.fromRawJson(String str) => Enigma.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Enigma.fromJson(Map<String, dynamic> json) => Enigma(
        ayuda: json["ayuda"],
        obs: json["obs"],
        respuesta: json["respuesta"],
        sobre: json["sobre"],
      );

  Map<String, dynamic> toJson() => {
        "ayuda": ayuda,
        "obs": obs,
        "respuesta": respuesta,
        "sobre": sobre,
      };

  factory Enigma.fromMap(Map<String, dynamic> json) => Enigma(
        ayuda: json["ayuda"],
        obs: json["obs"],
        respuesta: json["respuesta"],
        sobre: json["sobre"],
      );
}
