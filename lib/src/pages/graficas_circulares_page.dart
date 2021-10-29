import 'package:componentes/src/theme/theme.dart';
import 'package:componentes/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  static final String routeName = 'graficas_circulares';

  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.blue,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.yellow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.teal,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.brown,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress(
      {Key? key,
      required this.porcentaje,
      this.colorPrimario = Colors.red,
      this.colorSecundario = Colors.grey})
      : super(key: key);

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      height: 180,
      width: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.colorPrimario,
        colorSecundario: appTheme.textTheme.bodyText1!.color!,
      ),
    );
  }
}
