import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/screens/tags_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/posts_bloc/bloc/posts_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        centerTitle: true,
        title: "Posts".text.make(),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const CircularProgressIndicator().centered();
          }
          if (state is PostsLoadedState) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TagsScreen()));
                    },
                    child: "Go to Tags Screen".text.make()),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    var data = state.posts[index].featuredimage;
                    var imageUrl = data!.replaceAll("public", "storage");
                    return Column(
                      children: [
                        Image.network("https://demo.codersangam.com/$imageUrl"),
                        state.posts[index].title!.text.make(),
                      ],
                    );
                  },
                ),
              ],
            );
          }
          if (state is PostsErrorState) {
            return state.message.text.make();
          }
          return "something went wrong.".text.make();
        },
      ),
    );
  }
}
