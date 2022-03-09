import 'package:flutter/material.dart';

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
