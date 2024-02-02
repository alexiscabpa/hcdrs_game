//import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

Future<void> soundEnigmas(String sonido) async {
  Soundpool pool = Soundpool(streamType: StreamType.notification);

  int soundId = await rootBundle
      .load('assets/sonidos/${sonido}.mp3')
      .then((ByteData soundData) {
    print('Direccion de sonido: assets/sonidos/${sonido}.mp3');
    return pool.load(soundData);
  });
  int streamId = await pool.play(soundId);
  print('StreamID : $streamId');
}
