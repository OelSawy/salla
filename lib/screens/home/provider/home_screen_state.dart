import 'package:salla/core/enums.dart';
import 'package:salla/data/models/category%20models/categories_model.dart';
import 'package:salla/data/models/category%20models/category_model.dart';

class HomeState {
  Status screenStatus = Status.loading;
  List<Datum?>? categories;
  List<DatumCategory?>? electronicsProducts;
  List<DatumCategory?>? lightingProducts;
  List<DatumCategory?>? clothesProducts;
  List<DatumCategory?>? preventCoronaProducts;
  List<DatumCategory?>? sportsProducts;
  List<DatumCategory?>? allProducts = [];
}
