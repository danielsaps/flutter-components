import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderCuadrado({this.color = defaultColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 300,
      color: this.color,
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderBordesRedondeados({this.color = defaultColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 300,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderDiagonal({Key? key, this.color = defaultColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 300,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(this.color),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  final Color color;

  _HeaderDiagonalPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = this.color;
    paint.style =
        PaintingStyle.fill; // .fill para rellenar, .stroke para crear lineas
    paint.strokeWidth = 25;
    final path = new Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderTriangular({Key? key, this.color = defaultColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 400,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(this.color),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  final Color color;

  _HeaderTriangularPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = this.color;
    paint.style =
        PaintingStyle.fill; // .fill para rellenar, .stroke para crear lineas
    paint.strokeWidth = 25;
    final path = new Path();
    // path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 1);
    path.lineTo(0, size.height * 1);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderPico({Key? key, this.color = defaultColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(this.color),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  final Color color;

  _HeaderPicoPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = this.color;
    paint.style =
        PaintingStyle.fill; // .fill para rellenar, .stroke para crear lineas
    paint.strokeWidth = 25;
    final path = new Path();
    path.lineTo(size.width * 0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width * 1, size.height * 0.25);
    path.lineTo(size.width * 1, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderCurvo({Key? key, this.color = defaultColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 400,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(this.color),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  final Color color;

  _HeaderCurvoPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = this.color;
    paint.style =
        PaintingStyle.fill; // .fill para rellenar, .stroke para crear lineas
    paint.strokeWidth = 15;
    final path = new Path();
    path.lineTo(size.width * 0, size.height * 0.25);
    // path.lineTo(size.width * 1, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width * 1,
        size.height * 0.25);
    path.lineTo(size.width * 1, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  final Color color;
  static const defaultColor = Color(0xff615AAB);

  const HeaderWave({this.color = defaultColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 400,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = this.color;
    paint.style =
        PaintingStyle.fill; // .fill para rellenar, .stroke para crear lineas
    paint.strokeWidth = 15;
    final path = new Path();
    final altura = 0.50;
    final curva = 0.1;
    path.lineTo(size.width * 0, size.height * altura);
    // path.lineTo(size.width * 1, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * (altura + curva),
        size.width * 0.5, size.height * altura);
    path.quadraticBezierTo(size.width * 0.75, size.height * (altura - curva),
        size.width * 1, size.height * altura);
    path.lineTo(size.width * 1, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1,
          color2: color2,
        ),
        Positioned(
          top: -60,
          left: -70,
          child: FaIcon(
            // FontAwesomeIcons.plus,
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 70,
              width: double.infinity,
            ),
            Text(
              subtitulo,
              style: TextStyle(fontSize: 20, color: colorBlanco),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              // FontAwesomeIcons.plus,
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(
      {Key? key, required this.color1, required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
            colors: [
              // Color(0xff526BF6),
              // Color(0xff57acf2),
              color1,
              color2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
  }
}
