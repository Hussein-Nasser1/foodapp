import 'package:flutter/material.dart';
import 'package:foodorderingapp/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 60),
              child: Text(
                "This page are under \n        Construction.\n      Comming Soon!!",
                style: AppWidget.HeadlineTextFieldStyle(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Image.asset(
                "images/wallet.png",
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
