import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/sub/products/product.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  final int productId;
  final String title;
  final String image;
  final double price;

  ProductWidget({
    Key key,
    this.productId,
    this.title,
    this.image,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => Get.to(Product(
          ///Todo: Remove -1
          id: productId - 1,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.topCenter,
                        placeholder: (context, url) => Container(
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            height: 30,
                            child: Text(title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    height: 1.1,
                                    fontSize: 12)),
                          ),
                        ),
                      Row(
                        children: <Widget>[
                          if (price != null)
                            Text('\$${price.toInt()}',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(.9)))
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
