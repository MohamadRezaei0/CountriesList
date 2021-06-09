import 'package:countrylist/view/screen/country_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Country list app",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Get.to(() => CountryListScreen());
              },
              child: Container(
                width: 200,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: .1,
                      color: Colors.black,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "start",
                    style: TextStyle(fontSize: 22),
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
