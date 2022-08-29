import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/data/api_client/posts_api.dart';
import 'package:learnbloc/models/tags_model.dart';
import 'package:learnbloc/screens/tags_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/posts_bloc/bloc/posts_bloc.dart';
import '../blocs/tags_bloc/bloc/tags_bloc.dart';

class AddTags extends StatefulWidget {
  const AddTags({Key? key}) : super(key: key);

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  TextEditingController titleController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Add Tags".text.make(),
      ),
      body: BlocBuilder<TagsBloc, TagsState>(
        builder: (context, state) {
          return Column(
            children: [
              VxTextField(
                controller: titleController,
                hint: "Name",
              ),
              20.heightBox,
              VxTextField(
                controller: slugController,
                hint: "Slug",
              ),
              20.heightBox,
              ElevatedButton(
                  onPressed: () {
                    TagsModel tagsModel = TagsModel(
                        title: titleController.text, slug: slugController.text);
                    context.read<TagsBloc>().add(TagsAddEvent(tagsModel));
                  },
                  child: "Add Tag".text.make())
            ],
          );
        },
      ).pSymmetric(h: 10),
    );
  }
}
