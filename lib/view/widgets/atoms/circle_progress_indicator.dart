import 'package:flutter/material.dart';

class CircleProgressInd extends StatelessWidget {
  const CircleProgressInd({Key? key, required this.visibility})
      : super(key: key);
  final bool visibility;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );
  }
}
