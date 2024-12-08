import 'package:flutter/material.dart';

import '../model/faderouter.dart';
import '../pages/food_detail.dart';

class FoodCard extends StatefulWidget {
  final int id;
  final String cardText;
  final String cardImage;
  final String time;
  final bool fovorite;

  const FoodCard(
      {super.key, required this.id, required this.cardText, required this.cardImage, required this.time, this.fovorite = false});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  final CustomPainter painter = SimplePainter();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
             context,
             FadeRoute(page: FoodDetail(id: widget.id)), // Используем FadeRoute здесь
            );
            // Navigator.pushAndRemoveUntil(
            //     context, MaterialPageRoute(builder: (context) => FoodDetail(id: widget.id)), (route) => true);
          },
          child: Card(
            shadowColor: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 136,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 149,
                      height: 136,
                      child: Image.network(
                        widget.cardImage,
                        width: 149,
                        height: 136,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Image(
                    //   image: AssetImage(cardImage),
                    //   width: 149,
                    //   height: 136,
                    //   fit: BoxFit.cover,
                    // ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cardText,
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/clock_icon.png'),
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '${widget.time} минут',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(46, 204, 113, 1),
                                      height: 1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.fovorite)
          Positioned(
            right: 5,
            bottom: 30,
            child: CustomPaint(
              size: const Size(66, 24),
              painter: painter,
            ),
          ),
        if (widget.fovorite)
          Positioned(
            right: 10,
            bottom: 32,
            child: Text(
              widget.id.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
      ],
    );
  }
}

class SimplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(46, 204, 113, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(66, 0);
    path.lineTo(66, 24);
    path.lineTo(0, 24);
    path.lineTo(30, 12);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
