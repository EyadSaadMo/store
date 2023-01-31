import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';
import 'package:shop/models/products_model.dart';

class GetAllCategoriesService{
  Future<List<ProductsModel>> getCategory({required String catName}) async{
    List<dynamic> data = await HttpHelper().get(url: GETCATEGORIES+catName);
    List<ProductsModel>  categoriesList= [];
    for(int i = 0 ; i<data.length; i++){
      categoriesList.add(ProductsModel.fromJson(data[i]));
    }
    return categoriesList;
  }

}