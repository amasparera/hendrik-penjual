import 'package:flutter/material.dart';
import 'package:penjual/const/main_app.dart';

class ListHarga extends StatelessWidget {
  const ListHarga({
    Key? key,
    required this.text,
    this.bold = false,
    required this.quantity,
  }) : super(key: key);

  final String text;
  final String quantity;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              color: fontBlack,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        )),
        Text(
          quantity,
          style: TextStyle(
              fontSize: 12,
              color: fontBlack,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
