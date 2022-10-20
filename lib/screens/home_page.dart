import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_forum/providers/forum_provider.dart';
import 'add_page.dart';
import 'read_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Forum'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemCount: context.watch<ForumProvider>().articles.length,
            itemBuilder: (context, index) {
              int realIndex =
                  context.read<ForumProvider>().articles.length - 1 - index;
              return ListTile(
                leading: Text('${realIndex + 1}'),
                title: Text(
                  context.watch<ForumProvider>().articles[realIndex].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  context.read<ForumProvider>().changeCurrentIndex(realIndex);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadPage()));
                },
                subtitle: Text(context
                        .read<ForumProvider>()
                        .articles[realIndex]
                        .isEdited
                    ? '${context.read<ForumProvider>().articles[realIndex].editedAt}에 수정됨'
                    : '${context.read<ForumProvider>().articles[realIndex].createdAt}에 생성됨'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index < context.read<ForumProvider>().articles.length - 1) {
                return Divider();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
      ),
    );
  }
}
