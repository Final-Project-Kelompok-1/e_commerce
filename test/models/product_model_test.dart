import 'dart:convert';

import 'package:e_commerce/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  ProductModel testProductModel = ProductModel(
    product: [
      ProductDetailModel(
        id: 0,
        name: 'name',
        categoryId: 0,
        image: 'image',
        harga: 0,
        deskripsi: 'deskripsi',
        stock: 0,
        createDate: 'created_at',
        productCategory: ProductCategoryModel(id: 0, name: 'name'),
      ),
    ],
  );

  group('fromJson', () {
    test('should return valid model ProductModel from json', () {
      final jsonMap = json.decode(
        fixture('product.json'),
      );

      final result = ProductModel.fromJson(jsonMap);

      expect(result.product.first.name,
          equals(testProductModel.product.first.name));
    });
  });
}
