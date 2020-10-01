import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/sub/shops/shop_view.dart';
import 'package:get/get.dart';

class ShopsList extends StatelessWidget {
  final List shops;

  const ShopsList({Key key, this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 15);
          },
          scrollDirection: Axis.horizontal,
          itemCount: shops.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoButton(
              onPressed: () => Get.to(ShopView(id: index, shops: shops,)),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        height: 160.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withOpacity(0.06),
                                width: 3.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: shops[index]['logo'],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      shops[index]['title'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
