import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  const RadialProgress(
      {this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          // child: Text('${widget.porcentaje}'),
          child: CustomPaint(
            painter: _MiRadialProgress(
                (widget.porcentaje - diferenciaAnimar) +
                    diferenciaAnimar * controller.value,
                widget.colorPrimario,
                widget.colorSecundario),
          ),
        );
      },
    );

    // return Container(
    //   padding: EdgeInsets.all(10),
    //   width: double.infinity,
    //   height: double.infinity,
    //   // child: Text('${widget.porcentaje}'),
    //   child: CustomPaint(
    //     painter: _MiRadialProgress(widget.porcentaje),
    //   ),
    // );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario);

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradiente =
        new LinearGradient(colors: [Colors.green, Colors.yellow, Colors.red]);

    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 90);
    // final porcentaje = 5;

    // TODO: implement paint
    final paint = new Paint();
    paint.strokeWidth = 3;
    paint.color = colorSecundario;
    paint.style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = new Paint();
    paintArco.strokeWidth = 10;
    paintArco.color = colorPrimario;
    // paintArco.shader = gradiente.createShader(rect);
    paintArco.style = PaintingStyle.stroke;
    paintArco.strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), pi * 1.5,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
