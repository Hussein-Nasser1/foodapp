// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminData extends StatefulWidget {
  const AdminData({super.key});

  @override
  State<AdminData> createState() => _AdminDataState();
}

class _AdminDataState extends State<AdminData> {
  // final _adminUserStream =
  //     FirebaseFirestore.instance.collection("users").where("Email").get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 105.0))),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6.5),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(60.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "images/man.jpeg",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "name!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Email@me.me",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Terms & Condition",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () async {
                // AuthMethods().signOut();
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(builder: (context) => LogIn()),
                // );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LogOut",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
