import 'dart:io';

import 'package:flutter/material.dart';

import '../db/database.dart';
import '../model/comments_db_model.dart';
import 'package:file_picker/file_picker.dart';



class CommentWidget extends StatefulWidget {
  final int id;
  const CommentWidget({
    super.key, required this.id,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final formKey = GlobalKey<FormState>();
  final inputKey = GlobalKey();
  var textControllerComment = TextEditingController();

  late Future<List<Comment>> commentsList;
  PlatformFile? selectedFile;

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

  Future<PlatformFile?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return result.files.first;
    } else {
      // Пользователь отменил выбор файла
      return null;
    }
  }   

  Future<void> selectFile() async {
    PlatformFile? file = await pickFile();
    setState(() {
      selectedFile = file;
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
              return generateList(snapshot.data as List<Comment>, widget.id);
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
                    DBProvider.db.insertCommentdb(Comment(null, widget.id, value, imgsrc:selectedFile?.path ?? ''));
                    setState(() {
                      updateCommentList();
                      selectedFile = null;
                    });
                    textControllerComment.text = '';
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
                onPressed: () {selectFile();},
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

  SingleChildScrollView generateList(List<Comment> content, cid) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: content
            .map((comm) => Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: (comm.cid == cid)? Row(
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
                              (comm.imgsrc.isNotEmpty)?
                              Image.file(File(comm.imgsrc))
                              :Image.asset(
                                'assets/images/comment_img.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ):Container(),
                ))
            .toList(),
      ),
    );
  }
}
