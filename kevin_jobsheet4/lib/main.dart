import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;

  kelvin() {
    setState(() {
      _inputUser = double.parse(retrive1.text);
      _kelvin = _inputUser + 273;
    });
  }

  reamur() {
    setState(() {
      _inputUser = double.parse(retrive1.text);
      _reamur = (4 / 5) * _inputUser;
    });
  }

  fahrenheit() {
    setState(() {
      _inputUser = double.parse(retrive1.text);
      _fahrenheit = ((9 / 5) * _inputUser) + 32;
    });
  }

  TextEditingController retrive1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: retrive1,
              decoration: InputDecoration(
                labelText: 'Celcius',
                hintText: 'Masukkan Suhu Dalam Celcius',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(height: 8),
            DropdownButton(
                isExpanded: true,
                value: 'Fahrenheit',
                items: [
                  DropdownMenuItem(
                    child: Text('Kelvin'),
                    value: 'Celcius',
                  ),
                  DropdownMenuItem(
                    child: Text('Fahrenheit'),
                    value: 'Fahrenheit',
                  ),
                  DropdownMenuItem(
                    child: Text('Reamur'),
                    value: 'Reamur',
                  ),
                ],
                onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
