import 'package:flutter/material.dart';

class IngredietSteps extends StatefulWidget {
  final bool colorActive;
  final bool checkActive;
  final String nomer;
  final String ingText;
  final String ingTime;

  const IngredietSteps({
    super.key,
    required this.colorActive,
    required this.checkActive,
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
          color: widget.colorActive ? const Color.fromRGBO(225, 247, 234, 1) : const Color.fromRGBO(236, 236, 236, 1),
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
                  child: Text(widget.nomer,
                      style: TextStyle(
                          fontSize: 40,
                          color: widget.colorActive
                              ? const Color.fromRGBO(46, 204, 113, 1)
                              : const Color.fromRGBO(194, 194, 194, 1)))),
              Expanded(
                  flex: 3,
                  child: Text(widget.ingText,
                      style: TextStyle(
                          fontSize: 12,
                          color: widget.colorActive
                              ? const Color.fromRGBO(45, 73, 12, 1)
                              : const Color.fromRGBO(194, 194, 194, 1)))),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: widget.colorActive
                                  ? const Color.fromRGBO(22, 89, 50, 1)
                                  : const Color.fromRGBO(121, 118, 118, 1)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              checkColor: const Color.fromRGBO(22, 89, 50, 1),
                              fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Colors.transparent;
                                }
                                return Colors.transparent;
                              }),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(
                                width: 0,
                                color: Colors.transparent,
                              ),
                              value: widget.checkActive,
                              onChanged: (value) {
                                setState(() {});
                              }),
                        ),
                      ),
                      Text(widget.ingTime,
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.colorActive
                                  ? const Color.fromRGBO(22, 89, 50, 1)
                                  : const Color.fromRGBO(194, 194, 194, 1))),
                    ],
                  )),
            ],
          ),
        ));
  }
}
