import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/products_grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ShopView extends StatefulWidget {
  final int id;
  final List shops;

  const ShopView({Key key, this.id = 1, this.shops}) : super(key: key);

  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              brightness: Brightness.light,
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
              flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.white,
                  statusBarColor: Colors.transparent,
                ),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 300.0,
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: double.infinity,
                            imageUrl: widget.shops[widget.id]['image'],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 160.0,
                                width: 160.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 12,
                                          color: Colors.black.withOpacity(0.07))
                                    ],
                                    border: Border.all(
                                        color: Colors.white, width: 8.0)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.shops[widget.id]['logo'],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: Colors.black12,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  widget.shops[widget.id]['title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 10,
              shadowColor: Colors.black12,
              pinned: true,
              expandedHeight: 400,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    buildSocialTile(
                        text: 'Wolf_Express20',
                        icon: FontAwesomeIcons.facebookSquare),
                    buildSocialTile(
                        text: 'Wolf_e_mosul', icon: FontAwesomeIcons.instagram),
                    buildSocialTile(
                        text: 'Wolf_iq', icon: FontAwesomeIcons.whatsapp),
                    buildSocialTile(
                        text: '0770 123 4567',
                        icon: FontAwesomeIcons.phoneSquareAlt),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  ProductsGrid(),
                ],
              ),
            )
          ],
        ));
  }

  CupertinoButton buildSocialTile({String text, IconData icon}) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.black54,
            size: 27,
          ),
          SizedBox(width: 15),
          Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                  height: 2.2)),
        ],
      ),
    );
  }
}
