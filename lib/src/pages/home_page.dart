import 'package:componentes/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: accentColor,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 0),
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 110,
                  child: CircleAvatar(
                    backgroundColor: appTheme.currentTheme.accentColor,
                    child: Text(
                      'DS',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Expanded(
                  child: _lista(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lightbulb_outline,
                    color: accentColor,
                  ),
                  title: Text('Dark Mode'),
                  trailing: Switch.adaptive(
                    value: appTheme.darkTheme,
                    onChanged: (value) {
                      appTheme.darkTheme = value;
                    },
                    activeColor: accentColor,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_to_home_screen,
                    color: accentColor,
                  ),
                  title: Text('Custom Theme'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    },
                    activeColor: accentColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }

        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }

        return ListView(
          physics: BouncingScrollPhysics(),
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    // return ListView(
    //   children: _listaItems(),
    // );
  }

  List<Widget> _listaItems(List<dynamic>? items, BuildContext context) {
    final List<Widget> options = [];

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    items?.forEach((element) {
      final tmp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon'], context),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );

          // Navigator.push(context, route);

          Navigator.pushNamed(context, element['ruta']);
        },
      );

      options
        ..add(tmp)
        ..add(Divider(
          color: appTheme.primaryColorLight,
        ));
    });

    return options;

    // return [
    //   ListTile(
    //     title: Text('HolaMundo'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('HolaMundo'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('HolaMundo'),
    //   ),
    //   Divider(),
    // ];
  }
}
