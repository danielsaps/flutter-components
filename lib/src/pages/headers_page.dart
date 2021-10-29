import 'package:componentes/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  static final String routeName = 'headers';

  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      // body: HeaderCuadrado(),
      // body: HeaderBordesRedondeados(),
      // body: HeaderTriangular(),
      // body: HeaderPico(),
      // body: HeaderWave(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCuadrado(
              color: accentColor,
            ),
            HeaderBordesRedondeados(
              color: accentColor,
            ),
            HeaderTriangular(
              color: accentColor,
            ),
            HeaderPico(
              color: accentColor,
            ),
            HeaderCurvo(
              color: accentColor,
            ),
            HeaderWave(
              color: accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
