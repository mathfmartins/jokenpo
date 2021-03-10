import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Faça a sua escolha!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _imgMaquina = 'assets/images/papel.png';
  var _imgUsuario = 'assets/images/papel.png';
  var _resultado = '';
  
  obtemJogagaDaMaquina() {
    return Random().nextInt(3);
  }

  obtemJogada(String figura, jogUsuario) {
    var jogMaquina = obtemJogagaDaMaquina();
    var imgMaquina;

    if (jogMaquina == 0) {
      imgMaquina = 'assets/images/pedra.png';
      _imgUsuario = 'assets/images/' + figura + '.png';
    }

    if (jogMaquina == 1) {
      imgMaquina = 'assets/images/papel.png';
      _imgUsuario = 'assets/images/' + figura + '.png';
    }

    if (jogMaquina == 2) {
      imgMaquina = 'assets/images/tesoura.png';
      _imgUsuario = 'assets/images/' + figura + '.png';
    }
    
    var resultado = jogar(jogMaquina, jogUsuario);
    setState(() {
      this._imgMaquina = imgMaquina;
      _resultado = resultado;
    });
  }

  jogar(int jogMaquina, jogUsuario) {
      if (jogMaquina == 0) 
         if (jogUsuario == 0)
          return 'EMPATE!';
         else if (jogUsuario == 1)
          return 'PERDEU!';
         else 
          return 'PERDEU!';

       if (jogMaquina == 1) 
         if (jogUsuario == 0)
          return 'PERDEU!';
         else if (jogUsuario == 1)
          return 'EMPATE!';
         else 
          return 'GANHOU!';

      if (jogMaquina == 2) 
         if (jogUsuario == 0)
          return 'GANHOU!';
         else if (jogUsuario == 1)
          return 'PERDEU!';
         else 
          return 'EMPATE!';
  }  

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 0, // 2/3
              child: Image.asset('assets/images/home.jpeg'),
            ),
           SizedBox(
              height: 10,
           ),
            Flexible(
              flex: 1, // 2/3
              child: 
               Container(
                    // width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        RaisedButton(
                          color: Color.fromRGBO(40, 180, 229, 1),
                          child: Text(
                            "Pedra",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => {
                            obtemJogada('pedra', 0),
                          }
                        ),
                        SizedBox(width: 60),
                         RaisedButton(
                          color: Color.fromRGBO(40, 180, 229, 1),
                          child: Text(
                            "Papel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => {
                            obtemJogada('papel', 1),
                          }
                        ),
                        SizedBox(width: 60),
                         RaisedButton(
                          color: Color.fromRGBO(40, 180, 229, 1),
                          child: Text(
                            "Tesoura",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => {
                            obtemJogada('tesoura', 2),
                          }
                        ),
                      ],
                    ),
                  ),
            ),
            SizedBox(height: 20),
            Text(
              'Máquina'
            ),
            Flexible(
               flex: 1, // 2/3
               child: Center(
               child: Image.asset(this._imgMaquina, width: 80),
            ),
          ),
           SizedBox(height: 30),
            Text(
              'Você'
            ),
            Flexible(
               flex: 1, // 2/3
               child: Center(
               child: Image.asset(this._imgUsuario, width: 80),
            ),
          ),
         Text(_resultado)
          ],
          
      ),
      ),
    );
    
  }
}
