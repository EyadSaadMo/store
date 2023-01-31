import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';
import 'package:shop/models/products_model.dart';

class UpdateProduct {
  Future<ProductsModel> addProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
    await HttpHelper().post(url: UPDATEPRODUCT, body: {
      "id":id,
      "title":title,
      "price":price,
      "description":description,
      "image":image,
      "category":category,
    },);
    return ProductsModel.fromJson(data);
  }
}
