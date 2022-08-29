import 'package:http/http.dart' as http;
import 'package:learnbloc/models/tags_model.dart';
import '../../models/posts_model.dart';

class PostsApi {
  Future<List<PostsModel>> getPosts() async {
    const String mainUrl = "https://demo.codersangam.com/api/posts";
    var response = await http.get(Uri.parse(mainUrl));
    return postsModelFromJson(response.body);
  }

  Future<List<TagsModel>> getTags() async {
    const String tagsUrl = "https://demo.codersangam.com/api/tags";
    var response = await http.get(Uri.parse(tagsUrl));
    return tagsModelFromJson(response.body);
  }

  Future<List<TagsModel>> postTags(TagsModel tagsModel) async {
    const String tagsUrl = "https://demo.codersangam.com/api/add-tags";
    var response = await http.post(
      Uri.parse(tagsUrl),
      body: {"title": tagsModel.title, "slug": tagsModel.slug},
    );
    return tagsModelFromJson(response.body);
  }
}
