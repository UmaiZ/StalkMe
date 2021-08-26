import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:io' as io;
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stalkme_project/Helper/global.dart';

class profilePictureScreen extends StatefulWidget {
  @override
  _profilePictureScreenState createState() => _profilePictureScreenState();
}

class _profilePictureScreenState extends State<profilePictureScreen> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  File? imageFile;
  String accestoken = accessTokenGlobal;

  _imgFromCamera() async {
    final pickedFile =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _imageFile = pickedFile;
      imageFile = File(pickedFile!.path);
    });
  }

  _imgFromGallery() async {
    final pickedFile =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _imageFile = pickedFile;
      imageFile = File(pickedFile!.path);
      print(pickedFile.path);
    });
  }

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
                  padding:
                      const EdgeInsets.only(left: 13, bottom: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile Picture',
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
                    "Please browse or capture a profile picture for your StalkMe profile.",
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
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
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
                               
                            },
                            child: Text('',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI-SemiBold')),
                          ),
                          GestureDetector(
                              onTap: () async {
                                String SocialColorr =
                                    socialColorGlobal.toString().substring(10);
                                String SocialColorrApi = SocialColorr.toString()
                                    .substring(
                                        0, SocialColorr.toString().length - 1);

                                String UpdatetextColorrr =
                                    UpdatetextColor.toString().substring(10);
                                String UpdatetextColorApi =
                                    UpdatetextColorrr.toString().substring(
                                        0,
                                        UpdatetextColorrr.toString().length -
                                            1);

                                String sendColorrr11 =
                                    sendColorrr1.toString().substring(10);
                                String sendColorrr1Api = sendColorrr11
                                    .toString()
                                    .substring(
                                        0, sendColorrr11.toString().length - 1);

                                String sendColorrr22 =
                                    sendColorrr2.toString().substring(10);
                                String sendColorrr2Api = sendColorrr22
                                    .toString()
                                    .substring(
                                        0, sendColorrr22.toString().length - 1);

                                String sendColorrr33 =
                                    sendColorrr3.toString().substring(10);
                                String sendColorrr3Api = sendColorrr33
                                    .toString()
                                    .substring(
                                        0, sendColorrr33.toString().length - 1);

                                if (_imageFile != null) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return Center(
                                            child: SpinKitWave(
                                                color: kPrimaryColor,
                                                type: SpinKitWaveType.center));
                                      });

                                  Dio dio = new Dio();

                                  FormData formData = FormData.fromMap({
                                    "request_type": "update",
                                    "type": "biolink",
                                    "title": UpdateTitle.toString(),
                                    "description": UpdateDescription.toString(),
                                    "display_verified":
                                        UpdateverifiedCheck ? 1 : 0,
                                    "text_color": "#${UpdatetextColorApi}",
                                    "background_type": checkBackColor == "1"
                                        ? "preset"
                                        : checkBackColor == "2"
                                            ? "gradient"
                                            : checkBackColor == "3"
                                                ? "color"
                                                : checkBackColor == "1"
                                                    ? "Image"
                                                    : null,
                                    "background": checkBackColor == "1"
                                        ? backGroudColor
                                        : checkBackColor == "2"
                                            ? [
                                                "#${sendColorrr1Api}",
                                                "#${sendColorrr2Api}"
                                              ]
                                            : checkBackColor == "3"
                                                ? "#${sendColorrr1Api}"
                                                : checkBackColor == "4"
                                                    ? null
                                                    : null,
                                    "socials_color": "#${SocialColorrApi}",
                                    "socials[email]": UpdateEmail,
                                    "socials[tel]": UpdateTelephone,
                                    "socials[telegram]": UpdateTelegram,
                                    "socials[whatsapp]": UpdateWhatsApp,
                                    "socials[facebook]": UpdateFacebook,
                                    "socials[facebook-messenger]":
                                        UpdateFacebookMessenger,
                                    "socials[instagram]": UpdateInstagram,
                                    "socials[twitter]": UpdateTwitter,
                                    "socials[tiktok]": UpdateTiktok,
                                    "socials[youtube]": UpdateYoutube,
                                    "socials[soundcloud]": UpdateSoundCloud,
                                    "socials[linkedin]": UpdateLinkdin,
                                    "socials[spotify]": UpdateSpotify,
                                    "socials[pinterest]": UpdatePinterest,
                                    "url": globalUrl,
                                    "font": FontGlobal,
                                    "image": await MultipartFile.fromFile(
                                        _imageFile!.path,
                                        filename: _imageFile!.path.toString()),
                                    "link_id": linkGlobal,
                                    "url": globalUrl
                                  });
                                  dio.options.headers['content-Type'] =
                                      'application/x-www-form-urlencoded';
                                  dio.options.headers["authorization"] =
                                      "Bearer ${accestoken}";
                                  var response = await dio.post(
                                      'https://app.stalkme.co/api/update_biolink',
                                      data: formData);
                                  print(response);
                                  var data = json.decode(response.toString());

                                  if (data['status'].toString() == "success") {
                                    Navigator.pop(context);

                                    Fluttertoast.showToast(
                                        msg: data['message'][0].toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: kPrimaryColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => titleScreen()),
                                    );
                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => titleScreen()),
                                  );
                                }
                              },
                              child: Text('NEXT',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: 'SegoeUI-SemiBold')))
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffE6E6E6),
                    ),
                    SizedBox(
                      height: Height * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: _imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(_imageFile!.path),
                                height: Height * 0.175,
                                width: Height * 0.175,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : ImageUrlGlobal != ""
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    ImageUrlGlobal,
                                    height: Height * 0.175,
                                    width: Height * 0.175,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  height: Height * 0.175,
                                  width: Width * 1,
                                  child: SvgPicture.asset('images/camera.svg')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
