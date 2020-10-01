import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/widgets/app_drawer.dart';
import 'package:flutter_ecommerce/ui/screens/home.dart';
import 'package:flutter_ecommerce/ui/screens/sub/cart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
class App extends StatefulWidget {
  @override
  _App createState() => new _App();
}

class _App extends State<App> {
  ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        appBar: CustomAppBar(
          onTap: () => scrollUp(_scrollController),
          appBar: AppBar(
            title: Text('Wolf Express',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.w700))
                .tr(),
            centerTitle: true,
            brightness: Brightness.light,
            elevation: 10,
            shadowColor: Colors.black12,
            leading: IconButton(
              icon: Icon(LineIcons.bars),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () => Get.to(Cart()),
                icon: Icon(LineIcons.shopping_cart),
              ),
            ],
          ),
        ),
        body: Home(
          scrollController: _scrollController,
        ),
      ),
    );
  }

  void scrollUp(ScrollController scrollController) {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 320),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const CustomAppBar({Key key, this.onTap, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
