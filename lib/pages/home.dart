import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/pages/details.dart';
import 'package:foodorderingapp/pages/order.dart';
import 'package:foodorderingapp/service/database.dart';
import 'package:foodorderingapp/service/shared_pref.dart';
import 'package:foodorderingapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? usernamee;
  bool icecream = true, pizza = false, salad = false, burger = false;

  Stream? fooditemStream;

  ontheload() async {
    await getthesharedpref();
    fooditemStream = await DatabaseMethods().getFoodItem("Ice-Cream");
    setState(() {});
  }

  getthesharedpref() async {
    usernamee = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Detail"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.2),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds["Name"],
                                  style: AppWidget.SemibooldTextFieldStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  ds["Detail"],
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "\$" + ds["Price"],
                                  style: AppWidget.SemibooldTextFieldStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItemsVerticaly() {
    return StreamBuilder(
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Detail"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15.0, bottom: 5.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
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
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Name"],
                                        style:
                                            AppWidget.SemibooldTextFieldStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Detail"],
                                        style: AppWidget.LightTextFieldStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "\$" + ds["Price"],
                                        style:
                                            AppWidget.SemibooldTextFieldStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: usernamee == null
          ? CircularProgressIndicator()
          : Container(
              margin: const EdgeInsets.only(
                top: 50,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello " + usernamee! + " !",
                          style: AppWidget.boldTextFieldStyle()),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderCart(),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20.0),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Delicious Food",
                      style: AppWidget.HeadlineTextFieldStyle()),
                  Text("Discover and Get Great Food",
                      style: AppWidget.LightTextFieldStyle()),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: showItem(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 270,
                    child: allItems(),
                  ),
                  const SizedBox(height: 10),
                  Flexible(flex: 2, child: allItemsVerticaly()),
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
