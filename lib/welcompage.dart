

import 'package:eride/Admin/Admin.dart';
import 'package:eride/driver/singdriver.dart';
import 'package:eride/login.dart';
import 'package:eride/singup1.dart';
import 'package:eride/user/DriverRequestPage.dart' show DriverRequestPage;
import 'package:eride/user/Driverrent.dart';
import 'package:eride/user/Profileuser.dart';
import 'package:eride/user/Rentalconditions.dart';
import 'package:eride/user/Resultsearch.dart';
import 'package:eride/user/Riderequest.dart';
import 'package:eride/user/ShareRideDetasils.dart';
import 'package:eride/user/Takeuser.dart';
import 'package:eride/user/Taxiac.dart';
import 'package:eride/user/YourShare.dart';
import 'package:eride/user/homepageH.dart';
import 'package:flutter/material.dart';

class welcompage extends StatefulWidget {
  const welcompage({Key? key}) : super(key: key);

  @override
  State<welcompage> createState() => _welcompageState();
}

class _welcompageState extends State<welcompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0,bottom: 10),
                child: Text(
                  "",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 100),
                child: Text(
                  "",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 200.0),
              child: Container(
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/banner.png"),fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0,left: 18,right: 18),
              child: Row(
                children: [
                  // Expanded(
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.blueGrey, // background
                  //         foregroundColor: Colors.white, // foreground
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                  //       },
                  //       child: const Text("LOG IN")),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent , // background
                          foregroundColor: Colors.white, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Singup1()));
                        },
                        child: const Text("SIGN UP Go")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
