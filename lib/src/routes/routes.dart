import 'package:componentes/src/pages/emergency_page.dart';
import 'package:componentes/src/pages/slide_show_page.dart';
import 'package:componentes/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/animaciones_page.dart';
import 'package:componentes/src/pages/botones_page.dart';
import 'package:componentes/src/labs/circular_progress_page.dart';
import 'package:componentes/src/pages/drawable_page.dart';
import 'package:componentes/src/pages/graficas_circulares_page.dart';
import 'package:componentes/src/pages/headers_page.dart';
import 'package:componentes/src/pages/listview_horizontal_page.dart';
import 'package:componentes/src/labs/slideshow_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage(),
    ListViewHorizontalPage.routeName: (_) => ListViewHorizontalPage(),
    DrawablePage.routeName: (_) => DrawablePage(),
    BotonesPage.routeName: (_) => BotonesPage(),
    HeadersPage.routeName: (_) => HeadersPage(),
    AnimacionesPage.routeName: (_) => AnimacionesPage(),
    CircularProgressPage.routeName: (_) => CircularProgressPage(),
    GraficasCircularesPage.routeName: (_) => GraficasCircularesPage(),
    SlideShowPage.routeName: (_) => SlideShowPage(),
    SlideshowPage.routeName: (_) => SlideshowPage(),
    EmergencyPage.routeName: (_) => EmergencyPage(),
    SliverListPage.routeName: (_) => SliverListPage(),
  };
}
