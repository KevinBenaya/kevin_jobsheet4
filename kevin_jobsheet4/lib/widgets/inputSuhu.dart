import 'package:flutter/material.dart';

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
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Celcius',
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
    );
  }
}
