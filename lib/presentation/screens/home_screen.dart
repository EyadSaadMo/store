import 'package:flutter/material.dart';
import 'package:shop/core/App_Strings/app_strings_screens.dart';
import 'package:shop/core/servecies/all_producs_servecies.dart';
import 'package:shop/models/products_model.dart';
import 'package:shop/presentation/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.appBarName,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).iconTheme.color,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child:FutureBuilder(future: AllProductsService().getAllProducts(),
            builder: (ctx,snapshot){
          if(snapshot.hasData){
            List<ProductsModel>? products = snapshot.data;
            return  Padding(
              padding: const EdgeInsets.only(top: 60),
              child: GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 60,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: products!.length,
                  itemBuilder: (ctx, index) =>  ProductItem(model: products[index],)),
            );
          }
          print(snapshot.error);

          return const Center(child: CircularProgressIndicator());
            }
            ),
      ),
    );
  }
}
