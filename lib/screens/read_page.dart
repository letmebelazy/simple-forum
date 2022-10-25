import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/forum/forum_cubit.dart';
import 'edit_page.dart';
import 'home_page.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          BlocProvider.of<ForumCubit>(context).state
              .articles[BlocProvider.of<ForumCubit>(context).state.currentIndex]
              .title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage()));
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('삭제하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<ForumCubit>(context).deleteArticle(BlocProvider.of<ForumCubit>(context).state.currentIndex);
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
                  });
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0, top: 3.0),
                child: Text(
                  BlocProvider.of<ForumCubit>(context).state
                      .articles[BlocProvider.of<ForumCubit>(context).state.currentIndex]
                      .content,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
