import 'dart:convert';

import 'package:shop/core/network/endPoints.dart';
import 'package:shop/core/network/remote/api.dart';
import 'package:shop/models/products_model.dart';

class AllProductsService{
  Future<List<ProductsModel>> getAllProducts() async{
    List<dynamic> data = await HttpHelper().get(url: PRODUCTS);
    List<ProductsModel>  productList= [];
    for(int i = 0 ; i<data.length; i++){
      productList.add(ProductsModel.fromJson(data[i]));
    }
    return productList;
  }
}