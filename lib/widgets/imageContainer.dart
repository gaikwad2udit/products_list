import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class imageContainer extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String productName;
  final int productRating;

  const imageContainer({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.productName,
    required this.productRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          height: MediaQuery.of(context).size.height * .6,
          width: MediaQuery.of(context).size.height * .8,
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .45,
                // width: MediaQuery.of(context).size.height * .4,
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return Image.asset('assets/loading.gif');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(productName, style: TextStyle(fontSize: 16)),
                ),
                RatingBar.builder(
                  initialRating: productRating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 8),
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
