import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';
import 'package:shop/models/products_model.dart';

class AddProduct {
  Future<ProductsModel> addProduct({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await HttpHelper().post(url: ApiConstance.AddPRODUCT, body: {
          "title":title,
          "price":price,
          "description":description,
          "image":image,
          "category":category,
        },);
    return ProductsModel.fromJson(data);
  }
}
