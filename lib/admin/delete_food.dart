import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/pages/details.dart';
import 'package:foodorderingapp/service/database.dart';
import 'package:foodorderingapp/widget/widget_support.dart';

class DeleteItem extends StatefulWidget {
  const DeleteItem({super.key});

  @override
  State<DeleteItem> createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
  bool icecream = true, pizza = false, salad = false, burger = false;
  Stream? fooditemStream;
  String? collection = "Ice-Cream";

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem(collection!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text('Delete Item', style: AppWidget.HeadlineTextFieldStyle()),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: showItem(),
            ),
            SizedBox(height: 10.0),
            Flexible(
              flex: 5,
              child: StreamBuilder(
                  stream: fooditemStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            key: UniqueKey(),
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return Container(
                                margin:
                                    EdgeInsets.only(right: 15.0, bottom: 5.0),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            ds["Image"],
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Details(
                                                        detail: ds["Detail"],
                                                        name: ds["Name"],
                                                        price: ds["Price"],
                                                        image: ds["Image"],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  ds["Name"],
                                                  style: AppWidget
                                                      .SemibooldTextFieldStyle(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(
                                                ds["Detail"],
                                                style: AppWidget
                                                    .LightTextFieldStyle(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(
                                                "\$" + ds["Price"],
                                                style: AppWidget
                                                    .SemibooldTextFieldStyle(),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 110),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    DatabaseMethods()
                                                        .deleteFoodItem(
                                                            snapshot.data
                                                                .docs[index].id,
                                                            collection!);

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .orangeAccent,
                                                                content: Text(
                                                                  "Item Deleted Successfully",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18.0),
                                                                )));
                                                  },
                                                  child: Icon(Icons.delete)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : CircularProgressIndicator();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Ice-Cream");
            collection = "Ice-Cream";

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
            collection = "Pizza";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            fooditemStream = await DatabaseMethods().getFoodItem("Salad");
            collection = "Salad";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            fooditemStream = await DatabaseMethods().getFoodItem("Burger");
            collection = "Burger";
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
