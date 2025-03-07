import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:eride/api/api.dart';
import 'package:eride/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';



class singuser extends StatefulWidget {
  const singuser({Key? key}) : super(key: key);

  @override
  _singuserState createState() => _singuserState();
}

class _singuserState extends State<singuser> {
  late final _filename;
  late final _profilename;
  File? imageFile;
  late String storedImage;
  File? _image;
  File? _proimage;
  final picker = ImagePicker();

  bool  _isLoading = false;


  final _formKey = GlobalKey<FormState>();
  String? _idCardType;
  String? _selectedGender;
  final _idCardTypeList = [
    'Aadhar Card',
    'Voter ID Card',
    'Passport',
    'Driver License'
  ];
  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Other',
  ];
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _userNameController =
  TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();



  @override

  void dispose() {
    _dobController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();


  }

  Future _selectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _filename = basename(_image!.path).toString();

      } else {
        print('No image selected.');
      }
    });
  }

  Future _proselectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _proimage = File(pickedFile.path);
        _profilename = basename(_proimage!.path).toString();

      } else {
        print('No image selected.');
      }
    });
  }

  void registerUser() async {
    // Check if an image is selected


    setState(() {
      _isLoading = true;
    });

    var data = {
      "dob": _dobController.text,
      "username": _userNameController.text,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "password": _passwordController.text,
      "gender": _selectedGender,
      "idcard":_idCardType,
      "address": _addressController.text,
      "phoneNumber": _phoneNumberController.text,
      "email": _emailController.text,
      "idcardimag": _filename,
      "profilepic": _profilename


    };
    var res = await Api().authData(data,'/register/user-register');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      profile();
      id();
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
        this.context, //add this so it uses the context of the class
        MaterialPageRoute(
          builder: (context) => const Login(),
        ), //MaterialpageRoute
      );


    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  void id()async{

    final uri = Uri.parse('${Api().url}/register/userid');
    final request = http.MultipartRequest('POST', uri);
    final imageStream = http.ByteStream(_image!.openRead());
    final imageLength = await _image!.length();

    final multipartFile = http.MultipartFile(
      'file',
      imageStream,
      imageLength,
      filename: _filename,
    );
    request.files.add(multipartFile);

    print("multipart$multipartFile");
    final response = await request.send();
    if(response.statusCode == 200)
    {

      Fluttertoast.showToast(
        msg:"success",
        backgroundColor: Colors.grey,
      );


    }
    else
    {
      Fluttertoast.showToast(
        msg:"Failed",
        backgroundColor: Colors.grey,
      );

    }

  }
  void profile()async{

    final uri = Uri.parse('${Api().url}/register/userprofilepic');
    final request = http.MultipartRequest('POST', uri);
    final imageStream = http.ByteStream(_proimage!.openRead());
    final imageLength = await _proimage!.length();

    final multipartFile = http.MultipartFile(
      'file',
      imageStream,
      imageLength,
      filename: _profilename,
    );
    request.files.add(multipartFile);

    print("multipart$multipartFile");
    final response = await request.send();
    if(response.statusCode == 200)
    {

      Fluttertoast.showToast(
        msg:"success",
        backgroundColor: Colors.grey,
      );


    }
    else
    {
      Fluttertoast.showToast(
        msg:"Failed",
        backgroundColor: Colors.grey,
      );

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.red,
          ),
          label: const Text('Back', style: TextStyle(color: Colors.red)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Form(
            key: _formKey, // Add the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Register as user",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
const SizedBox(height: 20,),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300], // Background color for the avatar
                  backgroundImage: _proimage != null ? FileImage(_proimage!) : null,
                  child: _proimage == null
                      ? Icon(
                    Icons.person, // Placeholder icon if no image is selected
                    size: 50,
                    color: Colors.grey[600],
                  )
                      : null,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 2.0 ,bottom: 10),
                  child: ElevatedButton(
                    onPressed: _proselectImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Change button background color to red
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded button edges
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.camera_alt, // Icon before the text
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Select Profile Picture',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _userNameController,
                    maxLength: 12, // Restricting to 7 characters
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter User Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter User Name",
                      labelStyle: const TextStyle(color: Colors.red),
                      counterText: '', // Set the counterText to an empty string
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _firstNameController,

                    validator: (value) {

                      if (value!.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter First Name",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Last Name",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () async {
                      DateTime currentDate = DateTime.now();
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate.subtract(const Duration(days: 6570)), // 18 years ago
                        firstDate: DateTime(1900),
                        lastDate: currentDate,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.red,
                              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary), 
                              colorScheme: ColorScheme.light(primary: Colors.red).copyWith(secondary: Colors.red),
                            ),
                            child: child!,
                          );
                        },
                      );
                
                      setState(() {
                        _dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select Date of Birth';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Select Date of Birth",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    maxLength: 10,
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Phone Number';
                      }

                      // Remove any non-digit characters and check the length
                      String cleanedNumber = value.replaceAll(RegExp(r'\D'), '');
                      if (cleanedNumber.length != 10) {
                        return 'Phone Number should be exactly 10 digits';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Phone Number",
                      labelStyle: const TextStyle(color: Colors.red),
                      counterText: '',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      }

                      // Regular expression for basic email format validation
                      String emailPattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
                      RegExp regExp = RegExp(emailPattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid Gmail address';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Email",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only( left: 50.0,
                      right: 23,
                      top: 10,
                      bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _idCardType,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select ID Card Type';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _idCardType = value.toString();
                            });
                          },
                          items: _idCardTypeList.map((idCardType) {
                            return DropdownMenuItem(
                              value: idCardType,
                              child: Text(idCardType),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Select ID Card Type",
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),

                        child: ElevatedButton(
                          onPressed: _selectImage,
                          child: const Text('Select Image'),
                        ),

                      ),
                      const SizedBox(width: 20.0), // Add spacing between the two elements

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Address",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: DropdownButtonFormField(
                    value: _selectedGender,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                    items: _genderOptions.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Select Gender",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Password",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                    obscureText: true,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Confirm Password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


