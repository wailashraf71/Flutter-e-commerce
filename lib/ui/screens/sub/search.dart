import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/components/dummy_data.dart';
import 'package:flutter_ecommerce/ui/components/widgets/products/products_grid.dart';
import 'package:flutter_ecommerce/ui/components/widgets/search/search_bar.dart';
import 'package:flutter_ecommerce/ui/components/widgets/shops_list.dart';
import 'package:easy_localization/easy_localization.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.black12,
          iconTheme: IconThemeData(color: Colors.black),
          title: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SearchBar(
              searchController: _searchController,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Shops' ?? '',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ).tr(),
                ),
                SizedBox(height: 10),
                ShopsList(shops: shops),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Products' ?? '',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ).tr(),
                ),
                SizedBox(height: 20),
                ProductsGrid()
              ],
            ),
          ),
        ));
  }
}
