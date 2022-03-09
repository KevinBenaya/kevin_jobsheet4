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
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  List<String> listHasil = [];
  double calculationResult = 0;

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
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
            inputSuhu(retrive1: retrive1),
            SizedBox(height: 8),
            calculationTarget(
              selectedDropdown: selectedDropdown,
              listSatuanSuhu: listSatuanSuhu,
              onDropdownChanged: onDropDownChanged,
            ),
            SizedBox(height: 10),
            Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            lastCalculation(calculationResult: calculationResult),
            SizedBox(height: 10),
            temperaturConvertion(
              onPressed: konversiSuhu,
            ),
            SizedBox(height: 10),
            Text(
              'Riwayat Konversi',
              style: TextStyle(fontSize: 20),
            ),
            calculationHistory(listHasil: listHasil),
          ],
        ),
      ),
    );
  }

  void konversiSuhu() {
    return setState(() {
      if (retrive1.text.isNotEmpty) {
        calculationResult = double.parse(retrive1.text) * 2;
        switch (selectedDropdown) {
          case "Kelvin":
            calculationResult = double.parse(retrive1.text) + 273;
            listHasil.add('Kelvin');
            break;
          case "Reamur":
            calculationResult = double.parse(retrive1.text) * (4 / 5);
            listHasil.add('Reamur');
            break;
          case "Fahrenheit":
            calculationResult = (double.parse(retrive1.text) * ((9 / 5)) + 32);
            listHasil.add('Fahrenheit');
            break;
        }
        listHasil.add("Konversi dari " +
            retrive1.text +
            " Celcius ke " +
            selectedDropdown +
            " Dengan Hasil : " +
            calculationResult.toString());
      }
    });
  }
}

class temperaturConvertion extends StatelessWidget {
  const temperaturConvertion({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: Text('Konversi Suhu'),
          ),
        ),
      ],
    );
  }
}

class calculationTarget extends StatelessWidget {
  const calculationTarget({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu,
    required this.onDropdownChanged,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDropdown,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropdownChanged(value);
      },
    );
  }
}

class calculationHistory extends StatelessWidget {
  const calculationHistory({
    Key? key,
    required this.listHasil,
  }) : super(key: key);

  final List<String> listHasil;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listHasil.length,
        itemBuilder: (context, index) {
          return Text(listHasil[index]);
        },
      ),
    );
  }
}

class lastCalculation extends StatelessWidget {
  const lastCalculation({
    Key? key,
    required this.calculationResult,
  }) : super(key: key);

  final double calculationResult;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$calculationResult',
      style: TextStyle(fontSize: 32),
    );
  }
}

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.retrive1,
  }) : super(key: key);

  final TextEditingController retrive1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: retrive1,
      decoration: InputDecoration(
        labelText: 'Celcius',
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
