class ProductList {
  ProductList({
    required this.Products,
  });
  late final List<Product> Products;

  ProductList.fromJson(Map<String, dynamic> json) {
    Products =
        List.from(json['Products']).map((e) => Product.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Products'] = Products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Product {
  Product({
    required this.ProductName,
    required this.productRating,
    required this.productDescription,
    required this.productUrl,
  });
  late final String ProductName;
  late final int productRating;
  late final String productDescription;
  late final String productUrl;

  Product.fromJson(Map<String, dynamic> json) {
    ProductName = json['ProductName'];
    productRating = json['productRating'];
    productDescription = json['productDescription'];
    productUrl = json['productUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ProductName'] = ProductName;
    _data['productRating'] = productRating;
    _data['productDescription'] = productDescription;
    _data['productUrl'] = productUrl;
    return _data;
  }
}
