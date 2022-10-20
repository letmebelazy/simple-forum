import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_forum/providers/forum_provider.dart';

import 'home_page.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempTitle = '';
    String tempContent = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('글 수정'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    initialValue: context.read<ForumProvider>().articles[context.read<ForumProvider>().currentIndex].title ?? '',
                    onChanged: (value) {
                      tempTitle = value;
                    },
                    decoration: InputDecoration(
                      labelText: '제목',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 7.0, top: 3.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        initialValue: context.read<ForumProvider>().articles[context.read<ForumProvider>().currentIndex].content,
                        onChanged: (value) {
                          tempContent = value;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 7.0, top: 3.0),
                          border: InputBorder.none,
                          hintText: '내용',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      int flagSum = 0;
                      if (tempTitle.length < 2) {
                        flagSum++;
                      }

                      if (tempContent.length < 5) {
                        flagSum += 2;
                      }

                      switch (flagSum) {
                        case 1:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('제목을 두 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        case 2:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('내용을 다섯 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        case 3:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content:
                                      Text('제목을 두 글자 이상,\n내용을 다섯 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        default:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('수정하시겠습니까?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        String tempTime =
                                            DateFormat('yyyy-MM-dd HH:mm')
                                                .format(DateTime.now());
                                        context
                                            .read<ForumProvider>()
                                            .editTitle(context.read<ForumProvider>().currentIndex, tempTitle);
                                        context
                                            .read<ForumProvider>()
                                            .editContent(context.read<ForumProvider>().currentIndex, tempContent);
                                        context.read<ForumProvider>().toggleIsEdited(context.read<ForumProvider>().currentIndex);
                                        context.read<ForumProvider>().setEditedAt(context.read<ForumProvider>().currentIndex);
                                        Navigator.pop(context);
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                      },
                                      child: Text('확인'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('취소'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      color: Colors.blue,
                      child: Text(
                        '완료',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}