import 'package:flutter/material.dart';
import 'package:shop/core/App_Strings/app_strings_screens.dart';
import 'package:shop/core/servecies/update_product_service.dart';
import 'package:shop/models/products_model.dart';
import 'package:shop/presentation/widgets/custom_button.dart';
import 'package:shop/presentation/widgets/custom_ttf.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class UpdateProductScreen extends StatefulWidget {
  static const routeName = 'update_product';
   UpdateProductScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName;

  String? description;

  String? price;

  String? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel model = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).appBarTheme.titleTextStyle!.color,
          ),
          title: Text(
            AppString.updateProduct,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40.0,),
                CustomTF(
                    textInputType: TextInputType.name,
                    onChange: (data){
                      productName= data;
                    },
                    hintText: AppString.productName,),
                const SizedBox(height: 15,),
                CustomTF(
                    textInputType: TextInputType.name,
                  onChange: (data){
                    description= data;
                  },
                    hintText: AppString.productDescription,
                ),
                const SizedBox(height: 15,),
                 CustomTF(
                    textInputType: TextInputType.number,
                   onChange: (data){
                     price= data;
                   },
                    hintText: AppString.productPrice,

                    ),
                const SizedBox(height: 15,),
                 CustomTF(
                    textInputType: TextInputType.name,
                   onChange: (data){
                     image= data;
                   },
                    hintText: AppString.productImage,

                 ),
                const SizedBox(height: 40,),
                CustomButton(text: 'Update', onTap: ()async{
                  isLoading = true;
                  setState(() {

                  });

                  try{
                    await updateProduct(model);

                    print('success');
                  }catch(e){
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});

                },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel model)async{
   await UpdateProductService().updateProduct(
     id: model.id,
    title: productName == null?model.title:productName!,
    price: price == null?model.price.toString():price!,
    description:description== null?model.description:description!,
    image: image== null?model.image:image!,
    category: model.category);
    }
}
