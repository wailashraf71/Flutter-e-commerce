import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/screens/auth/login.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/branches/delivery_guys.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/company_account.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/orders/orders.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/products/products.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/shop_account.dart';
import 'package:flutter_ecommerce/ui/screens/sub/accounts/user_account.dart';
import 'package:flutter_ecommerce/ui/screens/sub/delivery_request.dart';
import 'package:flutter_ecommerce/ui/screens/sub/international_stores.dart';
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
                          fontSize: 30,

                          ///Todo: only if arabic use Tajawal font
                          fontFamily: GoogleFonts.tajawal().fontFamily,
                          height: 1.8,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ).tr()),
                Text(
                  '0.0.1',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.4)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              LineIcons.sitemap,
              color: Colors.black,
            ),
            title: Text(
              'Main Company',
            ).tr(),
            onTap: () => Get.to(CompanyAccount()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.user,
              color: Colors.black,
            ),
            title: Text(
              'My Profile',
            ).tr(),
            onTap: () => Get.to(UserAccount()),
          ),
          ListTile(
            leading: Icon(
              Icons.storefront,
              color: Colors.black,
            ),
            title: Text(
              'My Shop',
            ).tr(),
            onTap: () => Get.to(ShopAccount()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.cube,
              color: Colors.black,
            ),
            title: Text(
              'Products',
            ).tr(),
            onTap: () => Get.to(Products()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.check_circle,
              color: Colors.black,
            ),
            title: Text(
              'Orders',
            ).tr(),
            onTap: () => Get.to(Orders()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.users,
              color: Colors.black,
            ),
            title: Text(
              'Delivery Guys',
            ).tr(),
            onTap: () => Get.to(DeliveryGuys()),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              LineIcons.list_ul,
              color: Colors.black,
            ),
            title: Text(
              'Shops categories',
            ).tr(),
            onTap: () => Get.to(Shops()),
          ),
          ListTile(
            leading: Icon(
              LineIcons.paper_plane,
              color: Colors.black,
            ),
            title: Text(
              'Delivery request',
            ).tr(),
            onTap: () => Get.to(DeliveryRequest()),
          ),
              ListTile(
                leading: Icon(
                  LineIcons.link,
                  color: Colors.black,
                ),
                title: Text(
                  'International Stores',
                ).tr(),
                onTap: () => Get.to(InternationalStores()),
              ),
              ListTile(
                leading: Icon(
                  LineIcons.bell,
                  color: Colors.black,
                ),
                title: Text(
                  'Notifications',
                ).tr(),
                onTap: () => Get.to(Notifications()),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  LineIcons.unlock,
                  color: Colors.black,
                ),
                title: Text(
                  'Sign In',
                ).tr(),
                onTap: () => Get.to(Login()),
              ),
              ListTile(
                leading: Icon(
                  LineIcons.share,
                  color: Colors.black,
                ),
                title: Text(
                  'Share app',
                ).tr(),
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
                ).tr(),
                onTap: () => launch("tel://+9647712345678"),
              ),
              ListTile(
                leading: Icon(
                  LineIcons.comment,
                  color: Colors.black,
                ),
                title: Text(
                  'Terms & conditions',
                ).tr(),
                onTap: () => launch("https://flutter.dev"),
              ),
              ListTile(
                leading: Icon(
                  LineIcons.exclamation_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'About',
                ).tr(),
                onTap: () => launch("https://flutter.dev"),
              ),
            ],
          )),
    );
  }
}
