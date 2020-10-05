import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:url_launcher/url_launcher.dart';

class InternationalStores extends StatefulWidget {
  final int navId;

  const InternationalStores({Key key, this.navId}) : super(key: key);

  @override
  _InternationalStoresState createState() => _InternationalStoresState();
}

class _InternationalStoresState extends State<InternationalStores> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('International Stores',
                  style: TextStyle(fontWeight: FontWeight.w700))
              .tr(),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black12,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: internationalStores.length,
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 9 / 12,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            itemBuilder: (BuildContext context, int index) {
              return CupertinoButton(
                onPressed: () => launch(internationalStores[index]['url']),
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: CachedNetworkImage(
                                imageUrl:
                                    internationalStores[index]['logo'] ?? '',
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                placeholder: (context, url) =>
                                    Container(color: Colors.black12)),
                          )),
                    ),
                    Text(internationalStores[index]['title'] ?? 'No name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.bold,
                            height: 2,
                            fontSize: 13)),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
