import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/main.dart';

import 'getStarted.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/getStarted.dart';

import 'login.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userEmail = new TextEditingController();
  final TextEditingController userPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    double Status = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Height * 1,
          child: Column(
            children: <Widget>[
              Container(
                color: kPrimaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: Status * 1,
                    ),
                    SizedBox(
                      height: Height * 0.065,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, bottom: 13),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'SegoeUI-SemiBold'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text(
                        "Please login to your account in order to start using your StalkMe Profile.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SegoeUI'),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.04,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: kPrimaryColor,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 17, right: 17, bottom: 17),
                          //   child: Align(
                          //       alignment: Alignment.centerRight,
                          //       child: Text('',
                          //           style: TextStyle(
                          //               color: kPrimaryColor,
                          //               fontSize: 16,
                          //               fontFamily: 'SegoeUI-SemiBold'))),
                          // ),
                          // Container(
                          //   height: 1,
                          //   width: double.infinity,
                          //   color: Color(0xffE6E6E6),
                          // ),
                          SizedBox(
                            height: Height * 0.05,
                          ),
                          Container(
                            width: Width * 0.9,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Email Address',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: Container(
                              width: Width * 0.9,
                              child: TextFormField(
                                controller: userEmail,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: textGreyColor),
                                decoration: new InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE6E6E6), width: 1),
                                  ),
                                  filled: true,
                                  hintStyle: new TextStyle(
                                      color: textGreyColor, fontSize: 15),
                                  hintText: "Enter Email Address",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE6E6E6), width: 1),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Height * 0.02,
                          ),
                          Container(
                            width: Width * 0.9,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: Container(
                              width: Width * 0.9,
                              child: TextFormField(
                                controller: userPassword,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'Please enter a 6 digit password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: TextStyle(color: textGreyColor),
                                decoration: new InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE6E6E6), width: 1),
                                  ),
                                  filled: true,
                                  hintStyle: new TextStyle(
                                      color: textGreyColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI'),
                                  hintText: "Enter Password",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffE6E6E6), width: 1),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                            child: Container(
                              width: Width * 0.9,
                              height: Height * 0.06,
                              decoration: BoxDecoration(
                                  color: Color(0xffebf7f7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'GO BACK',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI'),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => getStartedScreen()),
                              // );
                              final isValid = _formKey.currentState!.validate();
                              FocusScope.of(context).unfocus();
      
                              if (isValid) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Center(
                                          child: SpinKitWave(
                                              color: kPrimaryColor,
                                              type: SpinKitWaveType.center));
                                    });
                                print('continue');
                                var url = 'https://app.stalkme.co/api/login';
                                print(url);
                                var map = new Map<String, dynamic>();
                                map['email'] = userEmail.text;
                                map['password'] = userPassword.text;
      
                                http.Response res =
                                    await http.post(Uri.parse(url),
                                        headers: <String, String>{
                                          'content-type':
                                              'application/x-www-form-urlencoded',
                                        },
                                        body: map);
                                var data = json.decode(res.body.toString());
                                print(data);
                                if (data['status'].toString() == "success") {
                                  Navigator.pop(context);
                                  accessTokenGlobal =
                                      data['access_token'].toString();
                                  final _storage = FlutterSecureStorage();
      
                                  await _storage.write(
                                      key: 'accessTokenLocal',
                                      value: data['access_token'].toString());
                                  await _storage.write(
                                      key: 'isLogin', value: "yes");
      
                                  Fluttertoast.showToast(
                                      msg: data['message'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: kPrimaryColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
      
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => getStartedScreen()),
                                  );
                                }
      
                                if (data['status'].toString() == "error") {
                                  Navigator.pop(context);
      
                                  Fluttertoast.showToast(
                                      msg: data['message'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: kPrimaryColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } else {
                                print('not valid');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 18),
                              child: Container(
                                width: Width * 0.9,
                                height: Height * 0.06,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
