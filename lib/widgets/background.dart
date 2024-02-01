import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.8],
            colors: [Color.fromARGB(255, 27, 28, 39), Color(0xff202333)]));

    return Stack(
      children: [
        // gradiente purpuras
        Container(
          decoration: boxDecoration,
        ),
        //pink box
        const Positioned(top: -100, left: -30, child: _PinkBox())
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 310,
        height: 310,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(219, 83, 4, 1),
              Color.fromRGBO(247, 139, 45, 1)
            ])),
      ),
    );
  }
}
