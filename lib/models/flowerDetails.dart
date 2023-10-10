import 'package:cloud_firestore/cloud_firestore.dart';
class FlowerDetail{
  final String id;
  final String flowerName;
  final String flowerImage;
  final String flowerDescription;
  final String items;
  final double flowerPrice;
  final double oldFlowerPrice;
  final double shippingCharges;
  final String deliveryDate;
  final double review;
FlowerDetail({
    required this.id,
    required this.flowerName,
    required this.flowerImage,
    required this.flowerDescription,
    required this.items,
    required this.flowerPrice,
    required this.oldFlowerPrice,
    required this.shippingCharges,
    required this.deliveryDate,
    required this.review,
  });

  factory FlowerDetail.fromJson(Map<String, dynamic> json) {
    return FlowerDetail(
      id: json['id'],
      flowerName: json['flowerName'],
      flowerDescription: json['flowerDescription'],
      flowerImage: json['flowerImage'],
      flowerPrice: (json['flowerPrice'] as num).toDouble(),
      items: json['items'],
      review: json['review'],
      shippingCharges: (json['shippingCharges'] as num).toDouble(),
      deliveryDate: json['deliveryDate'],
      oldFlowerPrice: (json['oldFlowerPrice'] as num).toDouble(),
    );
  }
}



 
  
