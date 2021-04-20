import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funtastic_app/productModel.dart';
import 'package:funtastic_app/ui/edit_update.dart';
import 'package:funtastic_app/ui/getProduct.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetProduct> plist = List();
  @override
  void initState() {
    super.initState();
    getPdata();
  }

  Future<List<GetProduct>> getPdata() async {
    Uri url = Uri.parse("https://mullonkal-hardwares.herokuapp.com/products");
    Response response = await get(url);
    var rb = response.body;
    var list = json.decode(rb) as List;
    List<GetProduct> products =
        list.map((e) => GetProduct.fromJson(e)).toList();
    print(list);

    setState(() {
      plist.addAll(products);
      // print(plist);
    });
    return getPdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*  Container(
                  height: 50,
                  color: Colors.blue[900],
                  child: Center(
                    child: Text(
                      "Mullonkal Hardwares",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )),*/
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*Text(
                              "Mullonkal Hardwares",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),*/
                            Card(
                              color: Colors.blue[800],
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (builder) {
                                          return InkWell(
                                            onTap: () => Get.to(EditUpdate()),
                                            child: new Container(
                                                height: 60.0,
                                                color: Colors
                                                    .transparent, //could change this to Color(0xFF737373),
                                                //so you don't have to change MaterialApp canvasColor
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: InkWell(
                                                    child: new Row(
                                                      children: [
                                                        Icon(Icons.edit,
                                                            color: Colors
                                                                .grey[600]),
                                                        SizedBox(width: 20),
                                                        Text("Edit and Update",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color:
                                                                    Colors.grey[
                                                                        600])),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          );
                                        });
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    //     controller: emailController,

                                    decoration: new InputDecoration(
                                        isDense: true,
                                        prefixIcon: Icon(Icons.search),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                        // border: InputBorder.none,
                                        border: new OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(50.0),
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                            color: Colors.grey[800]),
                                        hintText: "search",
                                        fillColor: Colors.grey[300]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: <Widget>[
                          chip('Health', Color(0xFFff8a65)),
                          chip('Food', Color(0xFF4fc3f7)),
                          chip('Lifestyle', Color(0xFF9575cd)),
                          chip('Sports', Color(0xFF4db6ac)),
                          chip('Nature', Color(0xFF5cda65)),
                          chip('Learn', Color(0xFFacbb65)),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("History",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[600])),
                              Text("See More",
                                  style: TextStyle(color: Colors.red[500]))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[800],
                                child: Text("S"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Screw Kit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black)),
                                    SizedBox(height: 5),
                                    Text(
                                      "Vasudevan Srew Company",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Spacer(),
                              Text(
                                "₹ 160",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[800],
                                child: Text("S"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Screw Kit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black)),
                                    SizedBox(height: 5),
                                    Text(
                                      "Vasudevan Srew Company",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Spacer(),
                              Text(
                                "₹ 160",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[800],
                                child: Text("S"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Screw Kit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black)),
                                    SizedBox(height: 5),
                                    Text(
                                      "Vasudevan Srew Company",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Spacer(),
                              Text(
                                "₹ 160",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[800],
                                child: Text("S"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Screw Kit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black)),
                                    SizedBox(height: 5),
                                    Text(
                                      "Vasudevan Srew Company",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Spacer(),
                              Text(
                                "₹ 160",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  //height: Get.height,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Items",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[600])),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("A",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[600])),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: plist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(plist[index].pname ??
                                        "this value is null"),
                                    subtitle: Text(
                                      plist[index].price ??
                                          "this value is nullS",
                                    ));
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget chip(String label, Color color) {
  return Chip(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(5))),
    labelPadding: EdgeInsets.symmetric(horizontal: 20),
    /*avatar: CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(label[0].toUpperCase()),
    ),*/
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.blue[800],
    elevation: 6.0,
    shadowColor: Colors.white,
    padding: EdgeInsets.all(6.0),
  );
}
