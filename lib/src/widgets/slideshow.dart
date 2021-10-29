import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;

  final bool puntosArriba;

  final Color colorPrimario;
  final Color colorSecundario;

  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.red,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 15.0,
    this.bulletSecundario = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              final provider =
                  Provider.of<_SliderModel>(context, listen: false);
              provider.colorPrimario = this.colorPrimario;
              provider.colorSecundario = this.colorSecundario;
              provider.bullerPrimario = this.bulletPrimario;
              // provider.bullerSecundario = this.bulletSecundario;
              return _EstructuraSlide(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _EstructuraSlide extends StatelessWidget {
  const _EstructuraSlide({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba)
          _Dots(
            this.slides.length,
          ),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.puntosArriba)
          _Dots(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   _Dot(
        //     index: 0,
        //   ),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
        children: List.generate(
          totalSlides,
          (index) => _Dot(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_SliderModel>(context);
    final currentPage = provider.currentPage;
    final colorPrimario = provider.colorPrimario;
    final colorSecundario = provider.colorSecundario;
    final bullerPrimario = provider.bullerPrimario;
    final bullerSecundario = provider.bullerSecundario;
    final enRango = (currentPage >= index - 0.5 && currentPage <= index + 0.5);
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: enRango ? bullerPrimario : bullerSecundario,
      height: enRango ? bullerPrimario : bullerSecundario,
      decoration: BoxDecoration(
        color: enRango ? colorPrimario : colorSecundario,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide(
        //     svg: MyAssets.slide1,
        //   ),
        //   _Slide(
        //     svg: MyAssets.slide2,
        //   ),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: this.slide,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.red;
  Color _colorSecundario = Colors.grey;
  double _bullerPrimario = 15.0;
  double _bullerSecundario = 12.0;

  double get currentPage => this._currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

  double get bullerPrimario => this._bullerPrimario;

  set bullerPrimario(double value) {
    this._bullerPrimario = value;
    // notifyListeners();
  }

  double get bullerSecundario => this._bullerSecundario;

  set bullerSecundario(double value) {
    this._bullerSecundario = value;
    // notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  // set colorPrimario(Color value) {
  //   this._colorPrimario = value;
  //   notifyListeners();
  // }
  set colorPrimario(Color value) {
    this._colorPrimario = value;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color value) {
    this._colorSecundario = value;
  }

  // set colorSecundario(Color value) {
  //   this._colorSecundario = value;
  //   notifyListeners();

}
