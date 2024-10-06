import 'package:flutter/material.dart';

class IngredietSteps extends StatefulWidget {
  final String nomer;
  final String ingText;
  final String ingTime;

  const IngredietSteps({
    super.key,
    required this.nomer,
    required this.ingText,
    required this.ingTime,
  });

  @override
  State<IngredietSteps> createState() => _IngredietStepsState();
}

class _IngredietStepsState extends State<IngredietSteps> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromRGBO(236, 236, 236, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(widget.nomer, style: const TextStyle(fontSize: 40, color: Color.fromRGBO(194, 194, 194, 1)))),
              Expanded(
                  flex: 3,
                  child: Text(widget.ingText, style: const TextStyle(fontSize: 12, color: Color.fromRGBO(194, 194, 194, 1)))),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Transform.scale(
                          scale: 2.2,
                          child: Checkbox(
                              checkColor: Colors.black38,
                              activeColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(width: 2, color: Color.fromRGBO(121, 118, 118, 1)),
                              value: false,
                              onChanged: (value) {
                                setState(() {});
                              })),
                      Text(widget.ingTime, style: const TextStyle(fontSize: 12, color: Color.fromRGBO(194, 194, 194, 1))),
                    ],
                  )),
            ],
          ),
        ));
  }
}
