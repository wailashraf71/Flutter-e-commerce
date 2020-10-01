import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _ageController;

  @override
  void initState() {
    _nameController = TextEditingController(text: 'John Doe');
    _emailController = TextEditingController(text: 'email@example.com');
    _phoneController = TextEditingController(text: '0771 234 5678');
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('My Profile', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: buildBottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.07),
                              width: 5.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Change photo',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Full Name',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: -7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                      hintText: 'John Doe',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Email Address',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: -7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                      hintText: 'email@example.com',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: -7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                      hintText: '+964 770 123 4567',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: -7)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                      hintText: '...',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                spreadRadius: 3)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CupertinoButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.all(15),
                        onPressed: () => () {},
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w800))),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
