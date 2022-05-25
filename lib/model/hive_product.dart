import 'package:hive/hive.dart';

part 'hive_product.g.dart';

@HiveType(typeId: 0)
class HiveProduct {
  HiveProduct({
    required this.ProductName,
    required this.productRating,
    required this.productDescription,
    required this.productUrl,
  });
  @HiveField(0)
  final String ProductName;
  @HiveField(1)
  final int productRating;
  @HiveField(2)
  final String productDescription;
  @HiveField(3)
  final String productUrl;
}
