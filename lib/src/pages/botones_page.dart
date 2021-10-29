import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  static final String routeName = 'botones';

  const BotonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botones'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 20,
            ),
            Divider(
              height: 10,
              // endIndent: 20,
              color: Colors.red,
              thickness: 1,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Stadium'),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Rounded Zero'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Rounded Circular 10'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Circle'),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), padding: EdgeInsets.all(24)),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated BeveledRectangleBorder'),
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Divider(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Stadium'),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
            ),
            Divider(height: 20),
            TextButton(onPressed: () {}, child: Text('TextButton')),
            Divider(height: 20),
            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            Divider(height: 20),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.access_alarms,
                color: Colors.green,
              ),
              color: Colors.red,
            ),
            Divider(height: 20),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.android),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Divider(height: 20),
            PopupMenuButton(
              tooltip: 'Esto es un PopupMenuButton',
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text('Opcion 1'), value: 1),
                  PopupMenuItem(child: Text('Opcion 2'), value: 2),
                  PopupMenuItem(child: Text('Opcion 3'), value: 3),
                  PopupMenuItem(child: Text('Opcion 4'), value: 4),
                ];
              },
            ),
            SizedBox(height: 20),
            DropdownButton(
              elevation: 16,
              onChanged: (value) => print(value),
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text('Opcion 1'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Opcion 2'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('Opcion 3'),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text('Opcion 4'),
                  value: 4,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
