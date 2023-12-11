import 'package:flutter/material.dart';
import 'package:foodorderingapp/admin/add_food.dart';
// import 'package:foodorderingapp/admin/admin_data.dart';
import 'package:foodorderingapp/admin/admin_login.dart';
import 'package:foodorderingapp/admin/delete_food.dart';
import 'package:foodorderingapp/admin/show_users.dart';
import 'package:foodorderingapp/widget/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => AdminData(),
                        //     ));
                      },
                      child: Icon(Icons.supervisor_account_outlined),
                    ),
                    Text('Home Admin',
                        style: AppWidget.HeadlineTextFieldStyle()),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminLogin(),
                            ));
                      },
                      child: Icon(Icons.logout_outlined),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFood(),
                    ));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            )),
                        SizedBox(width: 20.0),
                        Text(
                          "Add Food Items",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeleteItem(),
                    ));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            )
                            //   height: 100,
                            //   width: 100,
                            ),
                        SizedBox(width: 20.0),
                        Text(
                          "Delete Food Item",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowUsers(),
                    ));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            )
                            //   height: 100,
                            //   width: 100,
                            ),
                        SizedBox(width: 20.0),
                        Text(
                          "App Users",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
