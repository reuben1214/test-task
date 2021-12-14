import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.size,
      required this.textEditingController,
      required this.onChange})
      : super(key: key);

  final Size size;
  final TextEditingController textEditingController;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFieldPlus(
      textInputType: TextInputType.number,
      onChanged: onChange,
      cursorColor: Colors.white,
      textColor: Colors.white,
      controller: textEditingController,
      border: BorderPlus(color: Colors.white),
      radius: RadiusPlus.all(10),
      width: size.width * 0.4,
      height: size.height * 0.055,
    );
  }
}
