import 'package:flutter/material.dart';
import 'package:konversi_suhu/widgets/button.dart';
import 'package:konversi_suhu/widgets/inputSuhu.dart';
import 'package:konversi_suhu/widgets/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamor = 0;

  konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      _reamor = 4 / 5 * _inputUser;
      _kelvin = _inputUser + 273.15;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputSuhu(etInput: etInput),
              result(kelvin: _kelvin, reamor: _reamor),
              button(
                konversi: konversi,
              )
            ],
          ),
        ),
      ),
    );
  }
}
