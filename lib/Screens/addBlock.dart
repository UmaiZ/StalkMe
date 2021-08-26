import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/textColor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/verifiedCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'descriptionScreen.dart';
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
import 'descriptionScreen.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:io' as io;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/title.dart';
import 'package:image_picker/image_picker.dart';

class addBlockScreen extends StatefulWidget {
  @override
  _addBlockScreenState createState() => _addBlockScreenState();
}

class _addBlockScreenState extends State<addBlockScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.checkTrue();
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _switchValue = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController InputData1 = new TextEditingController();
  final TextEditingController InputData2 = new TextEditingController();

  String accestoken = accessTokenGlobal;
  String imageText = "Image.png";

  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  File? imageFile;
  var checkSwitch = [];
  bool showBlocks = false;

  checkTrue() {
    for (var res in BlocksArray) {
      if (res['is_enabled'] == "1") {
        checkSwitch.add(true);
      } else {
        checkSwitch.add(false);
      }
    }
    print(checkSwitch);
    setState(() {
      showBlocks = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    double Status = MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Status * 1,
                  ),
                  SizedBox(
                    height: Height * 0.065,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 13, bottom: 13, right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add Block',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'SegoeUI-SemiBold'),
                        ),
                        GestureDetector(
                          onTap: () {
                            String url = 'http://app.stalkme.co/${globalUrl}';
                            launch(url);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'PREVIEW',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 14,
                                  fontFamily: 'SegoeUI-SemiBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      "Please choose a block to add to your\nStalkMe profile.",
                      textAlign: TextAlign.left,
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
            Container(
              color: kPrimaryColor,
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            verifiedScreen()),
                                  );
                              },
                              child: Text(
                                'PREVIOUS',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontFamily: 'SegoeUI-SemiBold',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => textColorScreen()),
                                );
                              },
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontFamily: 'SegoeUI-SemiBold',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.52,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Create A New Link',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Destination URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter Destination URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData2,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText: "Enter Name",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData.fromMap({
                                                "request_type": "create",
                                                "type": "youtube",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });

                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "link",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "name":
                                                    InputData2.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffCC2929),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Link',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.52,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Create A Text Block',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Destination URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText: "Enter URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData2,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText: "Enter Title",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              print(InputData1.text);
                                              print(InputData2.text);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "text",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "name":
                                                    InputData2.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xff5F29CC),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Text',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A Sign Up Form',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText: "Enter Name",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue tiktok');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "mail",
                                                "name":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());
                                              print(data);

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffCC29CC),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Mail Sign Up',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A SoundCloud Song',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'SoundCloud URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter SoundCloud URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue sound cloud');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              print(globalUrl);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "soundcloud",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFF9933),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'SoundCloud',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A Spotify Song / Album',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Spotify URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText: "Enter Spotify URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue spotify');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "spotify",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });

                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffC14CC33),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Spotify',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A YouTube Video',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'YouTube Video URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter YouTube Video URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue youtube');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "youtube",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffCC2929),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Youtube',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A Twitch Video',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Twitch Video URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter Twitch Video URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue twitch');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "twitch",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());
                                              print(data);

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xff5F29CC),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Twitch',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A Vimeo Video',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Vimeo Video URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter Vimeo Video URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue vimeo');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "vimeo",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xff29B1CC),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'Vimeo',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(12.0),
                                    //     side: BorderSide(
                                    //         color:
                                    //             kPrimaryColor)),
                                    child: Container(
                                      height: Height * 0.36,
                                      width: Width * 0.95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Add A TikTok Video',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily:
                                                          'SegoeUI-SemiBold',
                                                      fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    InputData1.clear();
                                                    InputData2.clear();
                                                  },
                                                  child: Container(
                                                      child: SvgPicture.asset(
                                                          'images/cancel.svg')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Color(0xffE6E6E6),
                                          ),
                                          SizedBox(
                                            height: Height * 0.0175,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 17, right: 17),
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'TikTok Video URL',
                                                  style: TextStyle(
                                                      color: textGreyColor,
                                                      fontFamily: 'SegoeUI',
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 11, left: 17, right: 17),
                                            child: Container(
                                              child: TextFormField(
                                                controller: InputData1,
                                                key: ValueKey('name'),
                                                style: TextStyle(
                                                    color: textGreyColor,
                                                    fontFamily: 'SegoeUI'),
                                                decoration: new InputDecoration(
                                                  enabledBorder:
                                                      new OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                  ),
                                                  filled: true,
                                                  hintStyle: new TextStyle(
                                                      color: textGreyColor,
                                                      fontSize: 16,
                                                      fontFamily: 'SegoeUI'),
                                                  hintText:
                                                      "Enter TikTok Video URL",
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffE6E6E6),
                                                            width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Height * 0.018,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              // Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Center(
                                                        child: SpinKitWave(
                                                            color:
                                                                kPrimaryColor,
                                                            type:
                                                                SpinKitWaveType
                                                                    .center));
                                                  });
                                              print('continue tiktok');
                                              print(InputData1.text);
                                              print(InputData2.text);

                                              Dio dio = new Dio();
                                              print(linkGlobal);
                                              print(accestoken);
                                              FormData formData =
                                                  FormData.fromMap({
                                                "request_type": "create",
                                                "type": "tiktok",
                                                "location_url":
                                                    InputData1.text.toString(),
                                                "link_id": linkGlobal
                                              });
                                              dio.options
                                                      .headers['content-Type'] =
                                                  'application/x-www-form-urlencoded';
                                              dio.options.headers[
                                                      "authorization"] =
                                                  "Bearer ${accestoken}";
                                              var response = await dio.post(
                                                  'https://app.stalkme.co/api/create_update_biolink_block',
                                                  data: formData);
                                              var data = json
                                                  .decode(response.toString());
                                              print(data);

                                              if (data['status'].toString() ==
                                                  "success") {
                                                InputData1.clear();
                                                InputData2.clear();

                                                var url =
                                                    'https://app.stalkme.co/api/links?page=1&results_per_page=50';
                                                print(url);
                                                http.Response res =
                                                    await http.get(
                                                  Uri.parse(url),
                                                  headers: <String, String>{
                                                    'content-type':
                                                        'application/x-www-form-urlencoded',
                                                    'Authorization':
                                                        'Bearer $accestoken'
                                                  },
                                                );
                                                var data = json.decode(
                                                    res.body.toString());
                                                print(data);

                                                var contain = data['data']
                                                    .where((element) =>
                                                        element['id'] ==
                                                        linkGlobal)
                                                    .toList();
                                                print(contain);
                                                print(contain[0]
                                                    ['biolinks_blocks']);
                                                BlocksArray = contain[0]
                                                    ['biolinks_blocks'];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          addBlockScreen()),
                                                );
                                              }

                                              if (data['status'].toString() ==
                                                  "error") {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                    msg: data['message'][0]
                                                        .toString(),
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11, left: 17, right: 17),
                                              child: Container(
                                                height: Height * 0.06,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: Color(0xffCC29CC),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'TikTok',
                                    style: TextStyle(
                                        color: textGreyColor,
                                        fontSize: 16,
                                        fontFamily: 'SegoeUI'),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: textGreyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffE6E6E6),
                      ),
                      SizedBox(
                        height: Height * 0.035,
                      ),
                      BlocksArray.length > 0
                          ? Container(
                              width: Width * 0.9,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Already Existing Block',
                                  style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI'),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: Height * 0.035,
                      ),
                      showBlocks
                          ? BlocksArray.length > 0
                              ? Container(
                                  height: Height * 0.3,
                                  child: ReorderableListView(
                                    children: <Widget>[
                                      for (int index = 0;
                                          index < BlocksArray.length;
                                          index++)
                                        Container(
                                          key: Key('$index'),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13,
                                                right: 13,
                                                bottom: 13),
                                            child: Row(
                                              children: [
                                                Container(
                                                    child: SvgPicture.asset(
                                                        'images/menu.svg')),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: Height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffE6E6E6))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 13,
                                                              right: 13),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                    child: SvgPicture
                                                                        .asset(
                                                                            'images/clip.svg')),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      BlocksArray[index]['type'] ==
                                                                              "text"
                                                                          ? BlocksArray[index]['settings']['title']
                                                                              .toString()
                                                                          : BlocksArray[index]['type'] == "link"
                                                                              ? BlocksArray[index]['settings']['name'].toString()
                                                                              : BlocksArray[index]['type'].toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'SegoeUI-SemiBold',
                                                                        color:
                                                                            textGreyColor,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                    Text(
                                                                      BlocksArray[index]
                                                                              [
                                                                              'location_url']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              'SemiBold',
                                                                          color:
                                                                              textGreyColor),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            FlutterSwitch(
                                                              width: 52,
                                                              height: 32.5,
                                                              valueFontSize:
                                                                  12.0,
                                                              toggleSize: 20.0,
                                                              toggleColor:
                                                                  checkSwitch[
                                                                          index]
                                                                      ? Colors
                                                                          .white
                                                                      : Color(
                                                                          0xffE6E6E6),
                                                              switchBorder:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xffE6E6E6),
                                                                width:
                                                                    checkSwitch[
                                                                            index]
                                                                        ? 0
                                                                        : 1.0,
                                                              ),
                                                              activeColor:
                                                                  kPrimaryColor,
                                                              inactiveColor:
                                                                  Colors.white,
                                                              value:
                                                                  checkSwitch[
                                                                      index],
                                                              onToggle:
                                                                  (val) async {
                                                                print(val);
                                                                setState(() {
                                                                  checkSwitch[
                                                                          index] =
                                                                      !checkSwitch[
                                                                          index];
                                                                });
                                                                //       setState(() async {
                                                                //         checkSwitch[index] =
                                                                //       !checkSwitch[index];

                                                                Dio dio =
                                                                    new Dio();

                                                                FormData
                                                                    formData =
                                                                    FormData
                                                                        .fromMap({
                                                                  "request_type":
                                                                      "is_enabled_toggle",
                                                                  "biolink_block_id":
                                                                      BlocksArray[
                                                                              index]
                                                                          [
                                                                          'biolink_block_id'],
                                                                });

                                                                dio.options.headers[
                                                                        'content-Type'] =
                                                                    'application/x-www-form-urlencoded';
                                                                dio.options.headers[
                                                                        "authorization"] =
                                                                    "Bearer ${accestoken}";
                                                                var response =
                                                                    await dio.post(
                                                                        'https://app.stalkme.co/api/create_update_biolink_block',
                                                                        data:
                                                                            formData);
                                                                print(response);
                                                                //       });
                                                              },
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                    onReorder:
                                        (int oldIndex, int newIndex) async {
                                      setState(() {
                                        if (oldIndex < newIndex) {
                                          newIndex -= 1;
                                        }
                                        final item =
                                            BlocksArray.removeAt(oldIndex);
                                        BlocksArray.insert(newIndex, item);
                                        print(BlocksArray);
                                      });
                                      var map = new Map<String, dynamic>();
                                      map["request_type"] = "order";
                                      for (var i = 0;
                                          i < BlocksArray.length;
                                          i++) {
                                        map['Biolink_blocks[${i}][biolink_block_id}]'] =
                                            BlocksArray[i]['biolink_block_id'];
                                        map['Biolink_blocks[${i}][order]'] = i;
                                      }

                                      print('map');
                                      print(map);
                                      Dio dio = new Dio();
                                      print(linkGlobal);
                                      print(accestoken);
                                      print(InputData1.text);
                                      print(InputData2.text);
                                      FormData formData = FormData.fromMap(map);
                                      dio.options.headers['content-Type'] =
                                          'application/x-www-form-urlencoded';
                                      dio.options.headers["authorization"] =
                                          "Bearer ${accestoken}";
                                      var responsee = await dio.post(
                                          'https://app.stalkme.co/api/create_update_biolink_block',
                                          data: formData);
                                      var data =
                                          json.decode(responsee.toString());
                                      print(data);

                                      if (data['status'].toString() ==
                                          "success") {}

                                      if (data['status'].toString() ==
                                          "error") {
                                        Navigator.pop(context);
                                        Fluttertoast.showToast(
                                            msg: data['message'][0].toString(),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: kPrimaryColor,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    },
                                  ),
                                )
                              : Container()
                          : Container(),
                      SizedBox(
                        height: Height * 0.1,
                      ),
                    ],
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
