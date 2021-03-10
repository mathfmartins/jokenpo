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
      home: MyHomePage(title: 'JokeeenPO'),
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

  obtemJogadaDaMaquina() {
    return Random().nextInt(2);
  }
  obtemImgDaMaquina(int codigo) {
    if (codigo == 0) {
      return 'assets/images/pedra.png';
    }
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
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
                          onPressed: () => {}
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
                          onPressed: () => {}
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
                          onPressed: () => {}
                        ),
                      ],
                    ),
                  ),
            ),
            SizedBox(height: 20),
            Text(
              'Máquinha'
            ),
            Flexible(
               flex: 1, // 2/3
               child: Center(
               child: Image.asset('assets/images/pedra.png', width: 80),
            ),
          ),
           SizedBox(height: 30),
            Text(
              'Você'
            ),
            Flexible(
               flex: 1, // 2/3
               child: Center(
               child: Image.asset('assets/images/papel.png', width: 80),
            ),
          ),
          ],
          
      ),
      ),
    );
    
  }
}
