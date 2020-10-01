import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/dots_indicator.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/products_list.dart';
import 'package:flutter_ecommerce/ui/components/widgets/search/search_bar.dart';
import 'package:flutter_ecommerce/ui/components/widgets/shops_list.dart';
import 'package:flutter_ecommerce/ui/components/widgets/widget_header.dart';
import 'package:flutter_ecommerce/ui/screens/sub/products/products.dart';
import 'package:flutter_ecommerce/ui/screens/sub/shops/shops.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final ScrollController scrollController;

  const Home({Key key, this.scrollController}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _carouselController;

  @override
  void initState() {
    _carouselController = PageController(viewportFraction: 0.94);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchBar(preview: true),
            ),
            Column(
              children: [
                Container(
                    height: 175,
                    child: buildCarouselSlider(_carouselController)),
                DotsIndicator(
                    controller: _carouselController, count: slides.length)
              ],
            ),
            WidgetHeader(
              title: 'Latest Products',
              onTap: () => Get.to(Products(
                title: 'Latest Products',
              )),
              nextText: 'See all',
              child: ProductsList(
                products: products,
              ),
            ),
            WidgetHeader(
                title: 'Restaurants',
                onTap: () => Get.to(Shops()),
                nextText: 'See all',
                child: ShopsList(
                  shops: shops2,
                )),
            WidgetHeader(
              title: 'Recommended',
              onTap: () => Get.to(Products(
                title: 'Recommended',
              )),
              nextText: 'See all',
              child: ProductsList(
                products: products.reversed.toList(),
              ),
            ),
            WidgetHeader(
              title: 'Top Shops',
              onTap: () => Get.to(Shops()),
              nextText: 'See all',
              child: ShopsList(
                shops: shops,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Widgets
  Widget buildCarouselSlider(PageController carouselController) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: carouselController,
      itemCount: slides.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                imageUrl: slides[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
