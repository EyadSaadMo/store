import 'package:equatable/equatable.dart';

class ProductsModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  const ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.ratingModel,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, price, description, category];

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
      ratingModel: RatingModel.fromJson(json['rating']),);
  }
}

class RatingModel extends Equatable{
 final double rate;
 final int count;
 const RatingModel({required this.rate,required this.count});
 factory RatingModel.fromJson(json){
   return RatingModel(rate: json['rate'], count: json['count']);
 }

  @override
  // TODO: implement props
  List<Object?> get props => [rate,count];
}
