import 'package:http/http.dart' as http;

import '../../models/products_model.dart';

class ProductsApi {
  Future<ProductsModel> getProducts() async {
    const String mainUrl = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(mainUrl));
    return prouctsModelFromJson(response.body);
  }
}
