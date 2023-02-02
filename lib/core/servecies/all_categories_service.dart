import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';

class AllCategoriesService{
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await HttpHelper().get(url: ApiConstance.ALLCATEGORIES);
    return data;
  }
}