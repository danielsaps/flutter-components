import 'package:componentes/src/widgets/my_assets.dart';
import 'package:flutter/material.dart';

class DrawablePage extends StatelessWidget {
  static final String routeName = 'drawable';

  const DrawablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: _Drawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Atras'),
        ),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    MyAssets.menu,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: Text('Opcion 1'),
            leading: Icon(Icons.bug_report_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Opcion 2'),
            leading: Icon(Icons.report_problem),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
