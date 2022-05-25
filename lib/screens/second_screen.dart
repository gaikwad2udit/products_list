import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:products_app/model/hive_product.dart';
import 'package:products_app/model/products.dart';
import 'package:products_app/widgets/imageContainer.dart';

class secondScreen extends StatelessWidget {
  const secondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Products",
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: ListView.builder(
        itemCount: Hive.box('products').length,
        itemBuilder: (context, index) {
          final _prodcut = Hive.box('products').getAt(index) as HiveProduct;

          return imageContainer(
            productName: _prodcut.ProductName,
            description: _prodcut.productDescription,
            imageUrl: _prodcut.productUrl,
            productRating: _prodcut.productRating,
          );
        },
      ),
    );
  }
}
