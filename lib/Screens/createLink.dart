import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/profilePicture.dart';

import 'login.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/getStarted.dart';

import 'login.dart';
import 'package:http/http.dart' as http;

class createlinkScreen extends StatefulWidget {
  @override
  _createlinkScreenState createState() => _createlinkScreenState();
}

class _createlinkScreenState extends State<createlinkScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userLink = new TextEditingController();
  String accestoken = accessTokenGlobal;

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    double Status = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
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
                      'Create Link',
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
                    "Please use the field below to enter your StalkMe URL extension.",
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 17, right: 17, bottom: 17, left: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text('',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI-SemiBold')),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (userLink.text != null) {
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
                                  print(userLink.text);
                                  var url =
                                      'https://app.stalkme.co/api/create_biolink';
                                  print(url);
                                  print(accestoken);
                                  var map = new Map<String, dynamic>();
                                  map['request_type'] = "create";
                                  map['type'] = "biolink";
                                  map['url'] = userLink.text;

                                  http.Response res =
                                      await http.post(Uri.parse(url),
                                          headers: <String, String>{
                                            'content-type':
                                                'application/x-www-form-urlencoded',
                                            'Authorization':
                                                'Bearer $accestoken',
                                          },
                                          body: map);
                                  var data = json.decode(res.body.toString());
                                  print(data);
                                  if (data['status'].toString() == "success") {
                                    Navigator.pop(context);

                                    Fluttertoast.showToast(
                                        msg: data['message'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: kPrimaryColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    linkGlobal = data['details']['link_id'];
                                    globalUrl = userLink.text;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              profilePictureScreen()),
                                    );
                                  }

                                  if (data['status'].toString() == "error") {
                                    Navigator.pop(context);

                                    Fluttertoast.showToast(
                                        msg: data['message'].toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: kPrimaryColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => profilePictureScreen()),
                                  // );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            profilePictureScreen()),
                                  );
                                }
                              },
                              child: Text('NEXT',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI-SemiBold')),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      SizedBox(
                        height: Height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)),
                            child: Material(
                              shape: Border(
                                left: BorderSide(
                                  width: 1,
                                  color: Color(0xffE6E6E6),
                                ),
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xffE6E6E6),
                                ),
                                top: BorderSide(
                                  width: 1,
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                              child: Container(
                                width: Width * 0.6,
                                height: 53,
                                decoration: BoxDecoration(
                                  color: Color(0xffFAFAFA),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)),
                                ),
                                child: Center(
                                    child: Text(
                                  'https://www.app.stalkme.co/',
                                  style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: 15,
                                      fontFamily: 'SegoeUI'),
                                )),
                              ),
                            ),
                          ),
                          Container(
                            width: Width * 0.3,
                            height: 55,
                            child: TextFormField(
                              controller: userLink,
                              key: ValueKey('name'),
                              style: TextStyle(
                                  color: textGreyColor, fontFamily: 'SegoeUI'),
                              decoration: new InputDecoration(
                                                         isDense: true,

                                enabledBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE6E6E6), width: 1),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE6E6E6), width: 1),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
