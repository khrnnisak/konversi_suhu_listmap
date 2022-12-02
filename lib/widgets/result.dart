import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({
    Key? key,
    required double kelvin,
    required double reamor,
  })  : _kelvin = kelvin,
        _reamor = reamor,
        super(key: key);

  final double _kelvin;
  final double _reamor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Suhu dalam Kelvin",
              style: TextStyle(fontSize: 20),
            ),
            Text('$_kelvin', style: TextStyle(fontSize: 30)),
          ],
        ),
        Column(
          children: [
            Text("Suhu dalam Reamor", style: TextStyle(fontSize: 20)),
            Text('$_reamor', style: TextStyle(fontSize: 30)),
          ],
        ),
      ],
    );
  }
}
