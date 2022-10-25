import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/forum/forum_cubit.dart';
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
            itemCount: BlocProvider.of<ForumCubit>(context, listen: true).state.articles.length,
            itemBuilder: (context, index) {
              int realIndex = BlocProvider.of<ForumCubit>(context).state.articles.length - 1 - index;
              return ListTile(
                leading: Text('${realIndex + 1}'),
                title: Text(
                  BlocProvider.of<ForumCubit>(context, listen: true).state.articles[realIndex].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  BlocProvider.of<ForumCubit>(context).changeCurrentIndex(realIndex);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadPage()));
                },
                subtitle: Text(
              BlocProvider.of<ForumCubit>(context).state.articles[realIndex].isEdited
              ? '${BlocProvider.of<ForumCubit>(context).state.articles[realIndex].editedAt}에 수정됨'
              : '${BlocProvider.of<ForumCubit>(context).state.articles[realIndex].createdAt}에 생성됨'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index < BlocProvider.of<ForumCubit>(context).state.articles.length - 1) {
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
