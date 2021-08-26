import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stalkme_project/Screens/descriptionColor.dart';
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
import 'addBlock.dart';
import 'descriptionScreen.dart';
import 'fontScreen.dart';

class socialScreen extends StatefulWidget {
  @override
  _socialScreenState createState() => _socialScreenState();
}

class _socialScreenState extends State<socialScreen> {
  Color currentColor = socialColorGlobal;

  List<Color> currentColors = [Colors.limeAccent, Colors.green];
  String sendColor = "";
  String accestoken = accessTokenGlobal;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController userEmail = new TextEditingController();
  final TextEditingController userTelephone = new TextEditingController();
  final TextEditingController userTelegram = new TextEditingController();
  final TextEditingController userWhatsapp = new TextEditingController();
  final TextEditingController userFacebook = new TextEditingController();
  final TextEditingController userFacebookMessenger =
      new TextEditingController();
  final TextEditingController userInstagram = new TextEditingController();
  final TextEditingController userTwitter = new TextEditingController();
  final TextEditingController userTiktok = new TextEditingController();
  final TextEditingController userYoutube = new TextEditingController();
  final TextEditingController userSoundCloud = new TextEditingController();
  final TextEditingController userLinkedIn = new TextEditingController();
  final TextEditingController userSpotify = new TextEditingController();
  final TextEditingController userPinterest = new TextEditingController();

  @override
  void initState() {
    super.initState();

    userEmail.text = UpdateEmail;
    userTelephone.text = UpdateTelephone;
    userTelegram.text = UpdateTelegram;
    userWhatsapp.text = UpdateWhatsApp;
    userFacebook.text = UpdateFacebook;
    userFacebookMessenger.text = UpdateFacebookMessenger;
    userInstagram.text = UpdateInstagram;
    userTwitter.text = UpdateTwitter;
    userTiktok.text = UpdateTiktok;
    userYoutube.text = UpdateYoutube;
    userSoundCloud.text = UpdateSoundCloud;
    userLinkedIn.text = UpdateLinkdin;
    userSpotify.text = UpdateSpotify;
    userPinterest.text = UpdatePinterest;
  }

  void changeColor(Color color) => {
        setState(() {
          currentColor = color;
          String sendColorr = color.toString().substring(10);
          sendColor = sendColorr
              .toString()
              .substring(0, sendColorr.toString().length - 1);
          print(sendColor);
        })
      };
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    double Status = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: kPrimaryColor,
              child: Form(
                key: _formKey,
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
                      padding: const EdgeInsets.only(
                          left: 13, bottom: 13, right: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Socials',
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
                        "Please fill in information regarding your social handles.",
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
            ),
            Container(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        descriptionColorScreen()),
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
                            onTap: () async {
                              socialColorGlobal = currentColor;
                              UpdateEmail = userEmail.text.toString();
                              UpdateTelephone = userTelephone.text.toString();
                              UpdateTelegram = userTelegram.text.toString();
                              UpdateWhatsApp = userWhatsapp.text.toString();
                              UpdateFacebook = userFacebook.text.toString();
                              UpdateFacebookMessenger =
                                  userFacebookMessenger.text.toString();
                              UpdateInstagram = userInstagram.text.toString();
                              UpdateTwitter = userTwitter.text.toString();
                              UpdateTiktok = userTiktok.text.toString();
                              UpdateYoutube = userYoutube.text.toString();
                              UpdateSoundCloud = userSoundCloud.text.toString();
                              UpdateLinkdin = userLinkedIn.text.toString();
                              UpdateSpotify = userSpotify.text.toString();
                              UpdatePinterest = userPinterest.text.toString();
                              // Navigator.push(
                              //                                 context,
                              //                                 MaterialPageRoute(
                              //                                     builder: (context) => FontScreen()),
                              //                               );

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
                              String SocialColorr =
                                  socialColorGlobal.toString().substring(10);
                              String SocialColorrApi = SocialColorr.toString()
                                  .substring(
                                      0, SocialColorr.toString().length - 1);
                              print(
                                  ' ya color social color ha ${SocialColorrApi}');

                              String UpdatetextColorrr =
                                  UpdatetextColor.toString().substring(10);
                              String UpdatetextColorApi =
                                  UpdatetextColorrr.toString().substring(0,
                                      UpdatetextColorrr.toString().length - 1);

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

                              Dio dio = new Dio();
                              print(linkGlobal);
                              print(accestoken);
                              print(globalUrl);
                              FormData formData = FormData.fromMap({
                                "request_type": "update",
                                "type": "biolink",
                                "title": UpdateTitle.toString(),
                                "description": UpdateDescription.toString(),
                                "display_verified": UpdateverifiedCheck ? 1 : 0,
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
                              Navigator.pop(context);

                              var data = json.decode(response.toString());

                              print(data);
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
                                      builder: (context) => FontScreen()),
                                );
                              }

                              if (data['status'].toString() == "error") {
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
                    SizedBox(
                      height: Height * 0.025,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Buttons Color',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: currentColor,
                                    onColorChanged: changeColor,
                                    colorPickerWidth: 300.0,
                                    pickerAreaHeightPercent: 0.7,
                                    enableAlpha: false,
                                    displayThumbColor: true,
                                    showLabel: false,
                                    paletteType: PaletteType.hsv,
                                    pickerAreaBorderRadius:
                                        const BorderRadius.only(
                                      topLeft: const Radius.circular(2.0),
                                      topRight: const Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: Width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffE6E6E6))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: currentColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      height: 55,
                      child: TextFormField(
                        controller: userEmail,
                        key: ValueKey('name'),
                        style: TextStyle(color: textGreyColor),
                        decoration: new InputDecoration(
                          isDense: true,
                          enabledBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE6E6E6), width: 1),
                          ),
                          filled: true,
                          hintStyle:
                              new TextStyle(color: textGreyColor, fontSize: 15),
                          hintText: "Email@domain.com",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Telephone',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      height: 55,
                      child: TextFormField(
                        controller: userTelephone,
                        key: ValueKey('name'),
                        style: TextStyle(color: textGreyColor),
                        decoration: new InputDecoration(
                          isDense: true,
                          enabledBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE6E6E6), width: 1),
                          ),
                          filled: true,
                          hintStyle:
                              new TextStyle(color: textGreyColor, fontSize: 15),
                          hintText: "+00 000 000 000",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Telegram',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.3,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://t.me/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.6,
                          height: 55,
                          child: TextFormField(
                            controller: userTelegram,
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
                              hintText: "Telegram Username",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Whatsapp',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      height: 55,
                      child: TextFormField(
                        controller: userWhatsapp,
                        key: ValueKey('name'),
                        style: TextStyle(color: textGreyColor),
                        decoration: new InputDecoration(
                          isDense: true,
                          enabledBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE6E6E6), width: 1),
                          ),
                          filled: true,
                          hintStyle:
                              new TextStyle(color: textGreyColor, fontSize: 15),
                          hintText: "+00 000 000 000",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Facebook',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://facebook.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userFacebook,
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
                              hintText: "Facebook Page",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Facebook Messenger',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.3,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://m.me/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.6,
                          height: 55,
                          child: TextFormField(
                            controller: userFacebookMessenger,
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
                              hintText: "Facebook Page",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Instagram Username',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://instagram.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userInstagram,
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
                              hintText: "Instagram Username",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Twitter Username',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.39,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://twitter.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.51,
                          height: 55,
                          child: TextFormField(
                            controller: userTwitter,
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
                              hintText: "Twitter Username",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TikTok Username',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://tiktok.com/@',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userTiktok,
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
                              hintText: "TikTok Username",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'YouTube Channel',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://youtube.com/c/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userYoutube,
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
                              hintText: "Channel ID",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SoundCloud',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.5,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://soundcloud.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.4,
                          height: 55,
                          child: TextFormField(
                            controller: userSoundCloud,
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
                              hintText: "SoundCloud ID",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'LinkedIn',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://linkedin.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userLinkedIn,
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
                              hintText: "LinkdIn Profile",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Spotify',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.4,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://spotify.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.5,
                          height: 55,
                          child: TextFormField(
                            controller: userSpotify,
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
                              hintText: "Spotify Username",
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
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Container(
                      width: Width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pinterest',
                          style: TextStyle(
                              color: textGreyColor,
                              fontSize: 16,
                              fontFamily: 'SegoeUI'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.01,
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
                              width: Width * 0.45,
                              height: 53,
                              decoration: BoxDecoration(
                                color: Color(0xffFAFAFA),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                'https://pinterest.com/',
                                style: TextStyle(
                                    color: textGreyColor,
                                    fontSize: 15,
                                    fontFamily: 'SegoeUI'),
                              )),
                            ),
                          ),
                        ),
                        Container(
                          width: Width * 0.45,
                          height: 55,
                          child: TextFormField(
                            controller: userPinterest,
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
                              hintText: "Pinterest Username",
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
                    SizedBox(
                      height: Height * 0.075,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
