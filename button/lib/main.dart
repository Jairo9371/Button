import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userInput = '';
  String figura = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dibujar Figura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  userInput = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Escribe "triángulo" o "cuadrado"',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (userInput == 'triángulo') {
                    figura = 'triángulo';
                  } else if (userInput == 'cuadrado') {
                    figura = 'cuadrado';
                  } else {
                    figura = 'ninguna';
                  }
                });
              },
              child: Text('Aceptar'),
            ),
            SizedBox(height: 20),
            Text(
              'Figura dibujada: $figura',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            figura != 'ninguna' ? CustomPaint(
              size: Size(100, 100),
              painter: FiguraPainter(figura),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}

class FiguraPainter extends CustomPainter {
  final String figura;

  FiguraPainter(this.figura);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    if (figura == 'triángulo') {
      Path path = Path();
      path.moveTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      canvas.drawPath(path, paint);
    } else if (figura == 'cuadrado') {
      canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(FiguraPainter oldDelegate) => true;
}
