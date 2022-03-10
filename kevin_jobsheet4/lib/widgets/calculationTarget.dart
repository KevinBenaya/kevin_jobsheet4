import 'package:flutter/material.dart';

class calculationTarget extends StatelessWidget {
  const calculationTarget({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu,
    required this.onDropdownChanged,
    required this.konversi,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanged;
  final Function konversi;

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
        konversi();
      },
    );
  }
}
