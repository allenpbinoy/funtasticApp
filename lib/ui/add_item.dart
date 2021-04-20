import 'package:flutter/material.dart';
import 'package:funtastic_app/productModel.dart';
import 'package:funtastic_app/ui/home_page.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AddItem extends StatefulWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

Future<ProductModel> createProduct(String itemName, String itemDescription,
    String itemCategory, String itemPrice) async {
  var apiUrl = Uri.parse("https://mullonkal-hardwares.herokuapp.com/products");
  final response = await http.post(apiUrl, body: {
    "pname": itemName,
    "description": itemDescription,
    "categories": itemCategory,
    "price": itemPrice,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return productModelFromJson(responseString);
  }
}

class _AddItemState extends State<AddItem> {
  ProductModel _productModel;
  final TextEditingController itemnamectrl = TextEditingController();
  final TextEditingController itempricectrl = TextEditingController();
  final TextEditingController itemcategoriesctrl = TextEditingController();
  final TextEditingController itemdescriptctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.red[700],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new InkWell(
                        onTap: () {
                          Get.offAll(HomePage());
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Add New Item",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[900])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Item Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[900])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: itemnamectrl,
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              // border: InputBorder.none,
                              border: new OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              // hintText: "search",
                              fillColor: Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[900])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: itempricectrl,
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              // border: InputBorder.none,
                              border: new OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              // hintText: "search",
                              fillColor: Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[900])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: itemcategoriesctrl,
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              // border: InputBorder.none,
                              border: new OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              // hintText: "search",
                              fillColor: Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[900])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 90,
                        child: TextField(
                          controller: itemdescriptctrl,
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          minLines: 2,
                          // expands: true,
                          decoration: new InputDecoration(
                              isDense: true,
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              // border: InputBorder.none,
                              border: new OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              // hintText: "search",
                              fillColor: Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Add Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[900])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue[800],
                          child: Text("S"),
                        ),
                      ),
                      _productModel == null
                          ? Container()
                          : Text("The product ${_productModel.name} is added"),
                      FlatButton(
                        color: Colors.red,
                        onPressed: () async {
                          final String itemName = itemnamectrl.text;
                          final String itemPrice = itempricectrl.text;
                          final String itemCategory = itemcategoriesctrl.text;
                          final String itemDescription = itemdescriptctrl.text;

                          final ProductModel productModel = await createProduct(
                              itemName,
                              itemDescription,
                              itemCategory,
                              itemPrice);

                          setState(() {
                            _productModel = productModel;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Save",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
