import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:salla/data/core/api_routes.dart';
import 'package:salla/data/models/category%20models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {
  Future<List<DatumCategory?>?> getElectronics() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.electronicsCategory), headers: {"lang" : "en"});
    List<DatumCategory?>? data = categoryModelFromJson(response.body)!.data!.data;
    return data;
  }

  Future<List<DatumCategory?>?> getSports() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.sportsCategory), headers: {"lang" : "en"});
    List<DatumCategory?>? data = categoryModelFromJson(response.body)!.data!.data;
    return data;
  }

  Future<List<DatumCategory?>?> getPreventCorona() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.preventCoronaCategory), headers: {"lang" : "en"});
    List<DatumCategory?>? data = categoryModelFromJson(response.body)!.data!.data;
    return data;
  }

  Future<List<DatumCategory?>?> getClothes() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.clothesCategory), headers: {"lang" : "en"});
    List<DatumCategory?>? data = categoryModelFromJson(response.body)!.data!.data;
    return data;
  }
  
  Future<List<DatumCategory?>?> getLighting() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
    Response response = await http.get(Uri.parse(ApiRoutes.lightingCategory), headers: {"lang" : "en"});
    List<DatumCategory?>? data = categoryModelFromJson(response.body)!.data!.data;
    return data;
  }
}