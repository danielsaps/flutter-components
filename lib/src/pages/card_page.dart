import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardPage'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 20.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 20.0,
          ),
          CardTipo3(),
          SizedBox(
            height: 20.0,
          ),
          CartType4()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Column(
        children: [
          ListTile(
            title: Text('Texto'),
            subtitle: Text(
                'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum'),
            leading: Icon(Icons.access_alarm),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('OK'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://wallpaperaccess.com/full/400.jpg'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://wallpaperaccess.com/full/400.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Mi Imagen'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}

class CartType4 extends StatelessWidget {
  const CartType4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Container(
            height: 30,
            color: Colors.blue,
          ),
          Container(
            height: 80,
            color: Colors.red,
          ),
          Container(
            height: 30,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class CardTipo3 extends StatelessWidget {
  const CardTipo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5.0,
          )
        ],
      ),
    );
  }
}
