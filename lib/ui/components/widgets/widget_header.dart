import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  final String nextText;
  final VoidCallback onTap;
  final Widget child;

  WidgetHeader({Key key, this.title, this.nextText, this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: <Widget>[
        Container(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ).tr(),
                    if (nextText != null)
                      Container(
                          child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: onTap,
                              child: Row(children: <Widget>[
                                Text(
                                  nextText ?? '',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w600),
                                ).tr(),
                                Icon(
                                  Icons.chevron_right,
                                  size: 20,
                                  color: Theme.of(context).accentColor,
                                )
                              ]))),
                  ])),
        ),
        if (nextText == null) SizedBox(height: 10),
        Container(child: child),
      ]),
    );
  }
}
