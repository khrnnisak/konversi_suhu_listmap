import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          const InputDecoration(hintText: "Masukkan Suhu dalam Celcius"),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
      keyboardType: TextInputType.number,
    );
  }
}
