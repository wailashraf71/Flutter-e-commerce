import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderWidget extends StatelessWidget {
  final String title;
  final String image;

  const OrderWidget({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) =>
                        Container(color: Colors.black.withOpacity(0.08))),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    fontSize: 13)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              child: Icon(
                                LineIcons.close,
                                size: 17,
                              ),
                              onTap: () {})
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: DefaultTextStyle(
                        style: TextStyle(color: Colors.black54, fontSize: 11),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButton<String>(
                                items: <String>['S', 'M', 'L', 'XL']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      'Size - $value',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                                value: 'L',
                                isExpanded: true,
                                underline: Container(),
                                elevation: 0,
                                dropdownColor: Theme.of(context).primaryColor,
                                icon: Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.06),
                                width: 1,
                              ),
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                items:
                                    <String>['1', '2', '3'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      'Qty - $value',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                                value: '1',
                                isExpanded: true,
                                dropdownColor: Theme.of(context).primaryColor,
                                underline: Container(),
                                elevation: 0,
                                icon: Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('\$23',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              fontSize: 14)),
                    )
                  ],
                )),
          ),
        ]));
  }
}
