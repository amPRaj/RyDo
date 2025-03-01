import 'package:eride/driver/singdriver.dart';
import 'package:eride/login.dart';
import 'package:eride/user/singuser.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Singup1 extends StatefulWidget {
  const Singup1({Key? key}) : super(key: key);

  @override
  State<Singup1> createState() => _Singup1State();
}

class _Singup1State extends State<Singup1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      // appBar: AppBar(
      //   // Overide the default Back button
      //   automaticallyImplyLeading: false,
      //   leadingWidth: 100,
      //   leading: ElevatedButton.icon(
      //     onPressed: () => Navigator.of(context).pop(),
      //     icon: const Icon(Icons.arrow_left_sharp,color: Colors.redAccent,),
      //     label: const Text('Back',style: TextStyle(color:Colors.red )),
      //     style: ElevatedButton.styleFrom(

      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //     ),

      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   // other stuff

      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Color.fromARGB(255, 43, 41, 44)],
          ),
        ),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
              child: Container(
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/banner.png"),fit: BoxFit.cover),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 235, 230, 230),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 245, 242), // background
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
        // foreground
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const singuser()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "As User",
                      style: TextStyle(fontSize: 20,color: Colors.black),

                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // background
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
        // foreground
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const singdriver()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.drive_eta),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "As Driver",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: RichText(
                text: TextSpan(
                  text: "Already have a account? ",
                  style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 246, 242, 242)),
                  children:  <TextSpan>[
                    TextSpan(text: 'login', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            recognizer: TapGestureRecognizer()
            ..onTap = () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
            }),
        
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
