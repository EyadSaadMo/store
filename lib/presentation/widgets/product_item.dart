import 'package:flutter/material.dart';
import 'package:shop/models/products_model.dart';
import 'package:shop/presentation/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  ProductsModel model;

  ProductItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.routeName,arguments: model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 10,
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        r'$' '${model.price.toString()}',
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                      Expanded(
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 45,
              top: -60,
              child: Image.network(
                model.image,
                height: 100,
                width: 80,
              )),
        ],
      ),
    );
  }
}
