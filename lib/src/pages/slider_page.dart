import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valor = 100;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderPage'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamanio de la Imagen',
        // divisions: 20,
        value: _valor,
        min: 100.0,
        max: 400.0,
        onChanged: (_blockSlider)
            ? null
            : (double valor) {
                print(valor);
                setState(() {
                  _valor = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://wallpaperaccess.com/full/400.jpg'),
      width: _valor,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //     value: _blockSlider,
    //     onChanged: (value) {
    //       setState(() {
    //         if (value != null) {
    //           _blockSlider = value;
    //         }
    //       });
    //     });
    return CheckboxListTile(
      title: Text('Bloquear Slider?'),
      value: _blockSlider,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            _blockSlider = value;
          }
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider?'),
      value: _blockSlider,
      onChanged: (value) {
        setState(() {
          _blockSlider = value;
        });
      },
    );
  }
}
