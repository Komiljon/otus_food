import 'package:flutter/material.dart';

class IngredietRow extends StatelessWidget {
  final String name;
  final String wedghts;

  const IngredietRow({
    super.key,
    required this.name,
    required this.wedghts
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        Text(wedghts, style: const TextStyle(fontSize: 13, color: Color.fromRGBO(121, 118, 118, 1))),
      ],
    );
  }
}