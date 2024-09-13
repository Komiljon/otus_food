import 'package:flutter/material.dart';

class FoodCards extends StatelessWidget {
  final String cardText;
  final String cardUrl;
  final double horTitleGap;
  final String cardImage;
  final String time;

  const FoodCards(
      {super.key, required this.cardText, required this.cardUrl, required this.horTitleGap, required this.cardImage, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              Image(image: AssetImage(cardImage), width: 149, height: 136, fit:BoxFit.cover,),
              const SizedBox(width: 16,),
              Expanded(
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
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Image(image: AssetImage('assets/icons/clock_icon.png'), width: 16, height: 16,),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            time,
                            style: const TextStyle(
                            fontSize: 16.0, 
                            fontFamily: 'Roboto', 
                            fontWeight: FontWeight.w400, 
                            color: Colors.green,
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
            ],
          ),
        ),
      ),
    );
  }
}
