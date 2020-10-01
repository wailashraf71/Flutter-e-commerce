import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/product_widget.dart';
import 'package:flutter_ecommerce/ui/screens/sub/shops/shop_view.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

class Product extends StatefulWidget {
  final int id;

  Product({Key key, this.id = 2}) : super(key: key);

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> with TickerProviderStateMixin {
  PageController imagesPageController = PageController();

  int selectedVariantNumber = 0;

  String size = '41';
  String color = 'white';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          bottomNavigationBar: buildBottomBar(context),
          body: RefreshIndicator(
            onRefresh: () {
              return Future.value(0);
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  brightness: Brightness.light,
                  flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      systemNavigationBarColor: Colors.white,
                      statusBarColor: Colors.transparent,
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: imageView(),
                    ),
                  ),
                  leading: IconButton(
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back),
                      ),
                      onPressed: () => Get.back()),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: 10,
                  shadowColor: Colors.black12,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.53,
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        productInfo(),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: buildRelatedHeader(context),
                ),
                SliverToBoxAdapter(
                  child: buildRelated(),
                ),
                SliverPadding(padding: EdgeInsets.all(10))
              ],
            ),
          )),
    );
  }

  Widget buildRelated() {
    return Container(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 130,
              child: ProductWidget(
                title: products[index]['title'],
                productId: products[index]['id'],
                price: 12,
                image: products[index]['image'],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: products.length),
    );
  }

  Widget buildRelatedHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('More from this category',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.headline1.color,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                spreadRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              width: 50,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Icon(
                  LineIcons.minus_circle,
                  size: 25,

                  ///Todo: make function to check if quantity > 1 color: Theme.of(context).accentColor
                  color: Colors.black26,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text('1',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
            Container(
              width: 50,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Icon(
                  LineIcons.plus_circle,
                  size: 25,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ]),
          Container(
              width: MediaQuery.of(context).size.width * .56,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CupertinoButton(
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(15),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LineIcons.cart_plus),
                        SizedBox(width: 7),
                        Text("Add to cart",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                      ],
                    )),
              ))
        ],
      ),
    );
  }

  ///Widgets
  Widget imageView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      child: Stack(
        children: <Widget>[
          PageView.builder(
              physics: PageScrollPhysics(),
              controller: imagesPageController,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return CachedNetworkImage(
                    imageUrl: products[widget.id]['image'],
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    placeholder: (context, url) => Stack(children: <Widget>[
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.grey.withOpacity(.3),
                            ),
                          )
                        ]));
              }),
        ],
      ),
    );
  }

  Widget productInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///Title
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(products[widget.id]['title'],
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 1.2,
                  color: Colors.black)),
        ),

        ///Price
        Container(
          child: Text("\$60.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),

        ///Shop
        CupertinoButton(
          onPressed: () => Get.to(ShopView(id: 0)),
          padding: EdgeInsets.zero,
          child: Text(shops[widget.id]['title'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).accentColor.withOpacity(.75))),
        ),
        SizedBox(
          height: 30,
        ),

        ///Sizes
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildTypes(
              title: 'Size',
              values: sizes,
              valueHolder: size,
              onPressed: () {}),
        ),

        ///Colors
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildTypes(
              title: 'Color',
              values: colors,
              valueHolder: color,
              onPressed: () {}),
        ),
      ],
    );
  }

  Widget _buildTypes(
      {String title,
      String valueHolder,
      List<String> values,
      VoidCallback onPressed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ${valueHolder.capitalize}',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color:
                  Theme.of(context).textTheme.headline1.color.withOpacity(0.4)),
        ),
        SizedBox(
            height: 55.0,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        color: valueHolder == values[index]
                            ? Theme.of(context).accentColor.withOpacity(0.045)
                            : Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.021),
                        child: Text(
                          values[index].capitalize,
                          style: TextStyle(
                              fontSize: 13,
                              color: valueHolder == values[index]
                                  ? Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.95)
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.27),
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: onPressed),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                })),
      ],
    );
  }

  Widget productDescription(Product product) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    child: Text('Or do you need more?',
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ))
            ]));
  }
}
