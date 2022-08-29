import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/screens/add_tags.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/tags_bloc/bloc/tags_bloc.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({Key? key}) : super(key: key);

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Tags".text.make(),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddTags()));
              },
              child: "Add Tags".text.make()),
          BlocBuilder<TagsBloc, TagsState>(
            builder: (context, state) {
              if (state is TagsLoadingState) {
                return const CircularProgressIndicator().centered();
              }
              if (state is TagsLoadedState) {
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.tags.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 60,
                            child: Card(
                              child: state.tags[index].title!.text.xl2.bold
                                  .makeCentered(),
                            ),
                          );
                        }),
                  ],
                );
              }
              if (state is TagsErrorState) {
                return state.message.text.make();
              }

              return "Something went wrong".text.make();
            },
          ),
        ],
      ),
    );
  }
}
