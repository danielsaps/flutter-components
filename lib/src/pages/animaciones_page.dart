import 'dart:math';

import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  static final String routeName = 'animaciones';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> mover;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 4000,
      ),
    );

    rotacion = Tween(begin: 0.0, end: pi * 2.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    mover = Tween(begin: 0.0, end: 200.0).animate(controller);

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.5, curve: Curves.easeOut),
    ));

    opacidadOut = Tween(begin: 1.0, end: 0.1).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    agrandar = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    controller.addListener(() {
      // print('Status ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget? childCuadrado) {
        // print(rotacion.value);
        return Transform.translate(
          offset: Offset(mover.value, 0),
          child: Transform.rotate(
            child: Opacity(
              opacity: opacidad.value,
              child: Opacity(
                opacity: opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childCuadrado,
                ),
              ),
            ),
            angle: rotacion.value,
          ),
        );
      },
    );
    // return _Cuadrado();
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.green,
    );
  }
}
