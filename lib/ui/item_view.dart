import 'package:flutter/material.dart';
import 'package:funtastic_app/ui/home_page.dart';
import 'package:get/get.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key key}) : super(key: key);

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
                  color: Colors.blue[700],
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
                Text("Screw",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[900])),
              ],
            ),
          ),
          Container(
            height: Get.height,
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://picsum.photos/250?image=9',
                      width: Get.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("₹ 160",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.grey[900])),
                    ),
                    Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30))),

                      /*avatar: CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(label[0].toUpperCase()),
    ),*/
                      label: Text(
                        "Construction",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.grey[300],
                      elevation: 0.0,
                      shadowColor: Colors.white,
                      padding: EdgeInsets.all(6.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: Get.width,
                        child: Text(
                          "This text is very very very very very very very very very very very very very very very very very very very very very very very very very long",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
