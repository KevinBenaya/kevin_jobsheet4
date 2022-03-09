import 'package:flutter/material.dart';

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
