import 'package:flutter/material.dart';
import 'package:gecko_demo/view/widgets/atoms/input_field.dart';
import 'package:gecko_demo/view/widgets/atoms/label.dart';
import 'package:gecko_demo/view/widgets/atoms/vertical_margin.dart';

class InputFieldAndLabel extends StatelessWidget {
  const InputFieldAndLabel(
      {Key? key,
      required this.onValueChange,
      required this.label,
      required this.size,
      required this.textEditingController})
      : super(key: key);

  final Size size;
  final String label;
  final TextEditingController textEditingController;
  final Function(String) onValueChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(label: label),
        const VerticalMargin(height: 5),
        InputField(
          size: size,
          textEditingController: textEditingController,
          onChange: onValueChange,
        )
      ],
    );
  }
}
