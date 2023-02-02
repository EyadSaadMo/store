import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';
import 'package:shop/models/products_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data = await HttpHelper().put(
      url: '${ApiConstance.UPDATEPRODUCT}/$id',
      body: {
        "id":id.toString(),
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return ProductsModel.fromJson(data);
  }
}
