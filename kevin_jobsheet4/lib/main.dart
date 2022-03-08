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

  void konversiSuhu() {}

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
              value: selectedDropdown,
              items: listSatuanSuhu.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                onDropDownChanged(value);
              },
            ),
            SizedBox(height: 10),
            Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$calculationResult',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (retrive1.text.isNotEmpty) {
                          calculationResult = double.parse(retrive1.text) * 2;
                          switch (selectedDropdown) {
                            case "Kelvin":
                              calculationResult =
                                  double.parse(retrive1.text) + 273;
                              listHasil.add('Kelvin');
                              break;
                            case "Reamur":
                              calculationResult =
                                  double.parse(retrive1.text) * (4 / 5);
                              listHasil.add('Reamur');
                              break;
                            case "Fahrenheit":
                              calculationResult =
                                  (double.parse(retrive1.text) * ((9 / 5)) +
                                      32);
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
                    },
                    child: Text('Konversi Suhu'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Riwayat Konversi',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listHasil.length,
                itemBuilder: (context, index) {
                  return Text(listHasil[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
