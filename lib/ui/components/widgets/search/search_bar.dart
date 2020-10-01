import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/sub/search.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool preview;

  const SearchBar({Key key, this.searchController, this.preview = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      cursorColor: Theme.of(context).accentColor,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: preview ? false : true,

                      decoration: new InputDecoration(
                        hintText: tr('search_hint'),
                        hintStyle: TextStyle(
                          height: 2.5,
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.38),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5, right: 10),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(
                      LineIcons.search,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.38),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            if (preview)
              CupertinoButton(
                onPressed: () =>
                    Get.to(Search(), transition: Transition.fadeIn),
                child: Container(),
              ),
          ],
        ),
      ),
    );
  }
}
