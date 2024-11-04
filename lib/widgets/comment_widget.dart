import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  var textControllerComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 83,
              height: 73,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0),
                child: Image.asset(
                  'assets/images/comment_avatar.png',
                  width: 63,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'anna_obraztsova',
                          style: TextStyle(fontSize: 16, color: Color.fromRGBO(46, 204, 113, 1)),
                        ),
                        Text(
                          '25.05.2022',
                          style: TextStyle(fontSize: 14, color: Color.fromRGBO(194, 194, 194, 1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!',
                            style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      'assets/images/comment_img.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: TextField(
            decoration: InputDecoration(
              hintText: '',
              labelText: 'оставить комментарий',
              filled: true,
              fillColor: const Color.fromRGBO(236, 236, 236, 1),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(22, 89, 50, 1)),
              ),
              suffixIcon: IconButton(
                padding: const EdgeInsets.only(left: 5.0, top: 0.0, right: 7.0, bottom: 0.0),
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(
                  Icons.photo,
                  color: Color.fromRGBO(22, 89, 50, 1),
                  size: 24,
                ),
              ),
            ),
            controller: textControllerComment,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
