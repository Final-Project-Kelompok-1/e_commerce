class ProductModel {
  final List<Product> product;

  ProductModel({required this.product});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        product: json['data'] != null
            ? (json['data'] as List)
                .map(
                  (e) => Product.fromJson(e),
                )
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {'data': product};
}

class Product {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final int harga;
  final String deskripsi;
  final int stock;
  final String createDate;
  final ProductCategory productCategory;

  Product(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.image,
      required this.harga,
      required this.deskripsi,
      required this.stock,
      required this.createDate,
      required this.productCategory});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        name: json['name'] ?? "null",
        categoryId: json['category_id'] ?? 0,
        image: json['image'] ?? "null",
        harga: json['harga'] ?? 0,
        deskripsi: json['deskripsi'] ?? "null",
        stock: json['stock'] ?? 0,
        createDate: json['created_at'] ?? "null",
        productCategory: json['category'] != null
            ? ProductCategory.fromJson(
                json['category'],
              )
            : ProductCategory(id: 0, name: 'null'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'category_id': categoryId,
        'harga': harga,
        'deskripsi': deskripsi,
        'storck': stock,
        'created_at': createDate,
        'category': productCategory
      };
}

class ProductCategory {
  final int id;
  final String name;

  ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(id: json['id'] ?? 0, name: json['name'] ?? "null");

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
