import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:salla/data/core/api_routes.dart';
import 'package:salla/data/models/category%20models/categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesService {
  Future<List<Datum?>?> getCategories() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.categories), headers: {"lang" : "en"});
    CategoriesModel categoryModel = categoryModelFromJson(response.body)!;
    List<Datum?>? categories = categoryModel.data!.data;
    return categories;
  }
}