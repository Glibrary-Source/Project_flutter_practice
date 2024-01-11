
import '../vo/Product.dart' as ProductOfSaran;
import 'Sample.dart';

class ProductModel {
  int? totalCount;
  List<ProductOfSaran.Product>? data;

  Sample? sample;

  ProductModel({this.totalCount, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if(json['data'] != null) {
      data = <ProductOfSaran.Product>[];
      json['data'].forEach((v) {
        data!.add(new ProductOfSaran.Product.fromJson(v));
      });
    }
  }

}