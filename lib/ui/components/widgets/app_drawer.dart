import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/auth/login.dart';
import 'package:flutter_ecommerce/ui/screens/sub/delivery_request.dart';
import 'package:flutter_ecommerce/ui/screens/sub/notifications.dart';
import 'package:flutter_ecommerce/ui/screens/sub/shops/shops.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 15, top: 10),
                    child: Text(
                      'Wolf Express',
                      style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 30,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    )),
                Text(
                  '0.0.1',
                  style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.headline1.color.withOpacity(0.4)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              LineIcons.list_ul,
              color: Colors.black,
            ),
            title: Text(
              'Shops categories',
            ),
            onTap: () => Get.to(Shops()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.paper_plane,
              color: Colors.black,
            ),
            title: Text(
              'Delivery request',
            ),
            onTap: () => Get.to(DeliveryRequest()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.bell,
              color: Colors.black,
            ),
            title: Text(
              'Notifications',
            ),
            onTap: () => Get.to(Notifications()),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              LineIcons.unlock,
              color: Colors.black,
            ),
            title: Text(
              'Sign in',
            ),
            onTap: () => Get.to(Login()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.share,
              color: Colors.black,
            ),
            title: Text(
              'Share app',
            ),
            onTap: () =>
                Share.share('check out my website https://example.com'),
          ),
          ListTile(
            leading: Icon(
              LineIcons.phone,
              color: Colors.black,
            ),
            title: Text(
              'Contact us',
            ),
            onTap: () => launch("tel://+9647712345678"),
          ),
          ListTile(
            leading: Icon(
              LineIcons.comment,
              color: Colors.black,
            ),
            title: Text(
              'Terms & conditions',
            ),
            onTap: () => launch("https://flutter.dev"),
          ),
          ListTile(
            leading: Icon(
              LineIcons.exclamation_circle,
              color: Colors.black,
            ),
            title: Text(
              'About',
            ),
            onTap: () => launch("https://flutter.dev"),
          ),
        ],
      )),
    );
  }
}
