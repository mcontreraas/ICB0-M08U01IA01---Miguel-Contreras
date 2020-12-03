import 'package:flutter/material.dart';
  final estiloTitulo    = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);
  final estiloSubTitulo = TextStyle( fontSize: 18.0, color: Colors.white );

class AnimationFive extends StatefulWidget {

  @override
  _AnimationFiveState createState() => _AnimationFiveState();
}

class BarItem {
}

class _AnimationFiveState extends State<AnimationFive> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(context),
            Container(
              color: Colors.black,
              child: Column(children: [
            _crearTitulo(),
            _crearAcciones(context),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
              ],)
            )

          ],
        ),
      )
    );
  }

  }
  Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: Image(
          image: NetworkImage('https://ubistatic19-a.akamaihd.net/ubicomstatic/es-ES/global/logo/Trivial-Pursuit-Live_Logo_NOBG_184681.png'),
          height: 250.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Migui's Trivial", style: estiloTitulo ),
                  SizedBox( height: 7.0 ),
                  Text('What is a Trivial?', style: estiloSubTitulo ),
                ],
              ),
            ),

            Icon( Icons.star, color: Colors.pink, size: 30.0 ),
            Text('65', style: TextStyle( fontSize: 20.0, color: Colors.pink) )

          ],
        ),
      ),
    );
  }

  Widget _crearAcciones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion( Icons.gamepad_sharp, 'PLAY', context),

      ],
    );

  }



  Widget _accion(IconData icon, String texto, BuildContext context) {

    return Column(
      children: <Widget>[
        IconButton(icon: Icon( icon, color: Colors.deepOrangeAccent, size: 40.0 ), 
        onPressed: ()=> Navigator.pushNamed(context, 'scroll')),
        SizedBox( height: 5.0 ),
        Text( texto, style: TextStyle( fontSize: 20.0, color: Colors.white), )
      ],
    );

  }

  Widget _crearTexto() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'Sit minim aliqua minim laborum duis occaecat consectetur aliquip id ad deserunt. Adipisicing qui reprehenderit eu eu qui occaecat exercitation et aliqua laboris dolor. Nisi duis consectetur veniam id nulla deserunt aliqua velit ullamco. Deserunt exercitation adipisicing nostrud amet eu.',
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.white),
          
        ),
      ),
    );
  }

