import 'package:flutter/material.dart';

class IngredietSteps extends StatelessWidget {
  final String nomer;
  final String ingText;
  final String ingTime;

  const IngredietSteps({
    super.key, required this.nomer, required this.ingText, required this.ingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(                                
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(236, 236, 236, 1),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
            flex: 1,
            child: Text(nomer, style: const TextStyle(fontSize: 40, color: Color.fromRGBO(194, 194, 194, 1)))
            ),
            Expanded(
            flex: 3,
            child: Text(ingText, style: const TextStyle(fontSize: 12, color: Color.fromRGBO(194, 194, 194, 1)))
            ),
            Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text('[]', style: TextStyle(fontSize: 12, color: Color.fromRGBO(194, 194, 194, 1))),
                Text(ingTime, style: const TextStyle(fontSize: 12, color: Color.fromRGBO(194, 194, 194, 1))),
              ],
            )),
          ],
        ),
      )
    );
  }
}