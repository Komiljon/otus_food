import 'package:flutter/material.dart';

class FoodCards extends StatelessWidget {
  final String cardText;
  final String cardUrl;
  final double horTitleGap;
  final String cardImage;

  const FoodCards(
      {super.key, required this.cardText, required this.cardUrl, required this.horTitleGap, required this.cardImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 136,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                if (cardUrl != '') {
                  Navigator.pushNamedAndRemoveUntil(context, cardUrl, (route) => true);
                }
              },
              title: SizedBox(
                width: double.infinity,
                child: Text(
                  cardText,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              leading: Image(image: AssetImage(cardImage), width: 149, height: 136,),
              minVerticalPadding: 0.0,
              horizontalTitleGap: horTitleGap,
              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
