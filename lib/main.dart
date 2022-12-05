import 'package:flutter/material.dart';
import 'package:konversi_suhu/widgets/button.dart';
import 'package:konversi_suhu/widgets/inputSuhu.dart';
import 'package:konversi_suhu/widgets/result.dart';

import 'widgets/RiwayatKonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamor = 0;

  final inputController = TextEditingController();

  List<String> listViewItem = <String>[];

  var listItem = ["Kelvin", "Reamur"];

  void konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);

      switch (_newValue) {
        case "Kelvin":
          _result = _inputUser + 273;
          listViewItem.add("$_newValue : $_result");
          break;
        case "Reamur":
          _result = (4 / 5) * _inputUser;
          listViewItem.add("$_newValue : $_result");
          break;
      }
    });
  }

  dropdownOnChanged(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu- Inda Khoirun Nisak / 13"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              result(
                result_: _result,
              ),
              button(
                konversi: konversi,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RiwayatKonversi(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
