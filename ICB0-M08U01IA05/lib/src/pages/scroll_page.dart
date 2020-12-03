import 'package:flutter/material.dart';


class ScrollPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context)
        ],
      )
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }


  Widget _colorFondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0),
    );

  }

  Widget _imagenFondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: NetworkImage('https://i.pinimg.com/474x/e8/5c/f4/e85cf4b7398d80af2f862badc8fe5b2d.jpg'),
        fit: BoxFit.cover,
      ),
    );

  }

  Widget _textos() {

    final estiloTexto = TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0 ),
          Text('WELCOME TO', style: estiloTexto ),
          Text("MIGUI'S TRIVIAL", style: estiloTexto ),
          Text(" ", style: estiloTexto ),
          Icon(Icons.gamepad, size: 50),
          Text(" ", style: estiloTexto ),
          Text("SCROLL TO PLAY", style: estiloTexto ),
          Text(" ", style: estiloTexto ),
          Icon(Icons.arrow_circle_down, size: 50),
          Expanded( child: Container() ),
          Icon( Icons.keyboard_arrow_down, size: 70.0, color: Colors.white )
        ],
      ),
    );

  }

  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(220, 42, 11, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.white,
          textColor: Colors.red,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('PLAY', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: ()=> Navigator.pushNamed(context, 'splash'),
        ),
      ),
    );
  }


}