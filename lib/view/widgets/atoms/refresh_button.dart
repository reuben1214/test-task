import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.refresh,
          color: Colors.white,
        ));
  }
}
