import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  List<int> _listaNumeros = [];

  @override
  void initState() {
    super.initState();
    _agregarImagenes();

    _scrollController.addListener(() {
      final position = _scrollController.position.pixels;
      final finalPosition = _scrollController.position.maxScrollExtent;
      print('Scroll: $position = $finalPosition');
      if (position > finalPosition - 10) {
        // _agregarImagenes();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Stack(
        children: [_crearLista(), _mostrarLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: recargar,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final _imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$_imagen/500/300'),
          );
        },
      ),
    );
  }

  void _agregarImagenes() {
    final random = new Random();
    for (var i = 0; i < 4; i++) {
      _listaNumeros.add(random.nextInt(80));
    }
    setState(() {});
  }

  Future fetchData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      return new Timer(Duration(seconds: 2), respuestaHttp);
    }
  }

  void respuestaHttp() {
    _agregarImagenes();
    isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _mostrarLoading() {
    if (isLoading) {
      // return Center(
      //   child: CircularProgressIndicator(),
      // );
      return Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 25,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> recargar() async {
    var duration = Duration(seconds: 4);
    new Timer(duration, () {
      _listaNumeros.clear();
      _agregarImagenes();
    });
    duration = Duration(seconds: 5);
    return Future.delayed(duration);
  }
}
