import 'package:componentes/src/theme/theme.dart';
import 'package:componentes/src/widgets/my_assets.dart';
import 'package:componentes/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  static final String routeName = 'slide_show_page';

  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MiSlideshow(),
          MiSlideshow(),
        ],
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Expanded(
      child: Center(
        child: Slideshow(
          bulletPrimario: 17,
          bulletSecundario: 12,
          // puntosArriba: true,
          colorPrimario: currentTheme.accentColor,
          colorSecundario: Colors.yellow,
          slides: [
            SvgPicture.asset(MyAssets.slide1),
            SvgPicture.asset(MyAssets.slide2),
            SvgPicture.asset(MyAssets.slide3),
            SvgPicture.asset(MyAssets.slide4),
            SvgPicture.asset(MyAssets.slide5),
          ],
        ),
      ),
    );
  }
}
