import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:foodorderingapp/service/database.dart';
import 'package:foodorderingapp/widget/widget_support.dart';

class ShowUsers extends StatefulWidget {
  const ShowUsers({super.key});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  final _UserssStream =
      FirebaseFirestore.instance.collection("users").snapshots();

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
        title: Text('Users List', style: AppWidget.HeadlineTextFieldStyle()),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Flexible(
              flex: 5,
              child: StreamBuilder(
                stream: _UserssStream,
                builder: (context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: snapshot.data.docs.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];
                            return Container(
                              margin: EdgeInsets.only(right: 15.0, bottom: 5.0),
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
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "images/man.jpeg",
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
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         Details(
                                                //       detail: ds["Detail"],
                                                //       name: ds["Name"],
                                                //       price: ds["Price"],
                                                //       image: ds["Image"],
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                              child: Text(
                                                "Name: " + ds["Name"],
                                                style: AppWidget
                                                    .LightTextFieldStyle(),
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
                                              "Email: " + ds["Email"],
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
                                              "Wallet: " + ds["Wallet"],
                                              style: AppWidget
                                                  .SemibooldTextFieldStyle(),
                                            ),
                                          ),
                                          // Container(
                                          //   margin: EdgeInsets.only(left: 110),
                                          //   child: ElevatedButton(
                                          //       onPressed: () {
                                          //         DatabaseMethods()
                                          //             .deleteFoodItem(
                                          //                 snapshot.data
                                          //                     .docs[index].id,
                                          //                 collection!);

                                          //         ScaffoldMessenger.of(context)
                                          //             .showSnackBar(const SnackBar(
                                          //                 backgroundColor: Colors.orangeAccent,
                                          //                 content: Text(
                                          //                   "Item Deleted Successfully",
                                          //                   style: TextStyle(fontSize: 18.0),
                                          //                 )));
                                          //       },
                                          //       child: Icon(Icons.delete)),
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
