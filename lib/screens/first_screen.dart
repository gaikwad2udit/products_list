import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:products_app/model/hive_product.dart';
import 'package:products_app/model/products.dart';
import 'package:products_app/provider/repository.dart';
import 'package:products_app/screens/second_screen.dart';
import 'package:provider/provider.dart';

class firstPage extends StatefulWidget {
  const firstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  bool _isfetched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            _isfetched
                ? null
                : await Provider.of<Repository>(context, listen: false)
                    .loadJson();
            _isfetched =
                Provider.of<Repository>(context, listen: false).isfetched;

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => secondScreen(),
                ));
          },
          child: Text("show Products"),
        ),
      ),
    );
  }
}
