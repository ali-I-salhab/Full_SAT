import 'package:equatable/equatable.dart';

class StoreProductModel extends Equatable{

 const  StoreProductModel({
    required this.prodId,
    required this.prodName,
    required this.prodDesc,
    required this.count,
    required this.price,
  });

  final int prodId;
  final String prodName;
  final String prodDesc;
  final int count;
  final int price;

  factory StoreProductModel.fromJson(Map<String, dynamic> json) => StoreProductModel(
     prodId: json['id'],
    prodName: json['name'],
    prodDesc: json['desc'],
    count: json['count'],
    price: json['price']
  );

  Map<String, dynamic> toJson() => {
    "id": prodId,
    "name": prodName,
    "desc":prodDesc,
    "count":count,
    "price":price

  };

  @override
  List<Object?> get props => [this.prodId];
}