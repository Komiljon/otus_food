import 'package:flutter/material.dart';

import '../pages/food_detail.dart';

class FoodCard extends StatelessWidget {
  final int id;
  final String cardText;  
  final String cardImage;
  final String time;

  const FoodCard({super.key, required this.id, required this.cardText, required this.cardImage, required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => FoodDetail(id: id)
          ),
          (route) => true);
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
                Image.network(
                  cardImage,
                  width: 149,
                  height: 136,
                  fit: BoxFit.cover,
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
                      children: [
                        Text(
                          cardText,
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
                                time,
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
    );
  }
}
