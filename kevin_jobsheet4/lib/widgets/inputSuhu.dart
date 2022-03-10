import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
