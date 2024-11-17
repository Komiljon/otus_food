import 'package:flutter/material.dart';

import '../db/database.dart';
import '../model/comments_db_model.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final formKey = GlobalKey<FormState>();
  final inputKey = GlobalKey();
  var textControllerComment = TextEditingController();

  late Future<List<Comment>> commentsList;

  @override
  void initState() {
    super.initState();
    updateCommentList();
  }

  updateCommentList() {
    setState(() {
      commentsList = DBProvider.db.getCommentdb();
    });
  }

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
        FutureBuilder(
          future: commentsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return generateList(snapshot.data as List<Comment>);
            }
            if (snapshot.data == null || (snapshot.data as List<Comment>).isEmpty) {
              return Container();
            }
            return const CircularProgressIndicator();
          },
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Stack(children: [
            Form(
              key: formKey,
              child: TextFormField(
                key: inputKey,
                decoration: InputDecoration(
                  hintText: '',
                  labelText: '',
                  filled: true,
                  fillColor: const Color.fromRGBO(236, 236, 236, 1),
                  contentPadding: const EdgeInsets.only(top: 55, left: 10, bottom: 5, right: 10),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: const BorderSide(width: 1, color: Color.fromRGBO(22, 89, 50, 1)),
                  ),
                ),
                controller: textControllerComment,
                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: 1,
                onFieldSubmitted: (value) {
                  if (value.trim() != "") {
                    DBProvider.db.insertCommentdb(Comment(null, value));
                    setState(() {
                      updateCommentList();
                    });
                  }
                },
              ),
            ),
            const Positioned(
              top: 12,
              left: 10,
              child: Text(
                'оставить комментарий',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Positioned(
              top: 2,
              right: 0,
              child: IconButton(
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
          ]),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  SingleChildScrollView generateList(List<Comment> content) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: content
            .map((comm) => Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      comm.comment,
                                      style: const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1)),
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
                ))
            .toList(),
      ),
    );
  }
}
