import 'package:dio/dio.dart';
import 'package:final_project/models/categories_model.dart';

class DioHelper {
 CategoriesModel? categoriesModel;
  Future<List<CategoriesModel>> getCategoriesData() async {
    Response response = await Dio().get(
        "https://fakestoreapi.com/products");
    List<CategoriesModel>map=(response.data as List ).map((e)=>CategoriesModel.fromJson(e)).toList();
    return map;
  }
}