import 'package:flutter/material.dart';
import 'package:gecko_demo/utils/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.coinName, required this.rate})
      : super(key: key);
  final String coinName;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            IMG_BITCOIN,
          ),
          maxRadius: 25,
        ),
        title: Text(
          coinName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          rate,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
