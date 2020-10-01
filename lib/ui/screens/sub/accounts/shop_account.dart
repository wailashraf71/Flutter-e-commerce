import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:easy_localization/easy_localization.dart';
class ShopAccount extends StatefulWidget {
  @override
  _ShopAccountState createState() => _ShopAccountState();
}

class _ShopAccountState extends State<ShopAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop', style: TextStyle(fontWeight: FontWeight.w700)).tr(),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black12,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              brightness: Brightness.light,
              leading: Container(),
              flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.white,
                  statusBarColor: Colors.transparent,
                ),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        height: 300.0,
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          imageUrl:
                              'https://nichecrossfit.com.au/wp-content/uploads/placeholder.jpg',
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
                                  imageUrl:
                                      'https://www.riversideplazashepparton.com.au/wp-content/uploads/2015/10/image-store-placeholder-logo.png',
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Shop name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0),
                                  ).tr(),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    child: Icon(
                                      LineIcons.edit,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 10,
              shadowColor: Colors.black12,
              expandedHeight: 400,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    productsPlaceholder()
                  ],
                ),
              ),
            )
          ],
        ));
  }

  GridView productsPlaceholder() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 9,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                child: Container(
                  color: Colors.black12,
                )),
          );
        });
  }
}
