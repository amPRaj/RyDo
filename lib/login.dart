import 'dart:convert';
import 'dart:ffi';
import 'package:eride/Admin/Admin.dart';
import 'package:eride/api/api.dart';
import 'package:eride/driver/Driverhome.dart';
import 'package:eride/singup1.dart';
import 'package:eride/user/HomePage2Section.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/user/homepageH.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  String admin = "0";
  String user = "1";
  String driver = "3";
  String storedvalue = '1';

  TextEditingController passcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  late String role;
  late String status;
  late SharedPreferences localStorage;

  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username': usercontroller.text.trim(),
      'password': passcontroller.text.trim(),
    };

    var res = await Api().authData(data, '/login/login');
    var body = json.decode(res.body);
    
    if (body['success'] == true) {
      role = json.encode(body['details']['role']);
      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('role', role.toString());
      localStorage.setString('login_id', json.encode(body['login_id']));
      
      if (admin == role.replaceAll('"', '')) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Adminhome()));
      } else if (driver == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Driverhome()));
      } else if (user == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homeuser()));
      } else {
        Fluttertoast.showToast(msg: "Please wait for admin approval", backgroundColor: Colors.grey);
      }
    } else {
      Fluttertoast.showToast(msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 119, 224),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Color.fromARGB(255, 43, 41, 44)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0),
                const Text("Welcome back", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 5),
                const Text("Welcome back! Please enter your details.",
                    style: TextStyle(fontSize: 16, color: Colors.white70)),
                 SizedBox(height: 50),
                TextField(
                  controller: usercontroller,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _pressLoginButton,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Text("Sign in with Google", style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      children: [
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      children: [
                        TextSpan(
                          text: "Sign up for free",
                          style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const homepage()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 140),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
