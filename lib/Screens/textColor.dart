import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stalkme_project/Screens/descriptionColor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/verifiedCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';

import 'descriptionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/profilePicture.dart';
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

class textColorScreen extends StatefulWidget {
  @override
  _textColorScreenState createState() => _textColorScreenState();
}

class _textColorScreenState extends State<textColorScreen> {
    Color currentColor = UpdatetextColor;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  String sendColor ="";

  void changeColor(Color color) => {
    setState(() {
      currentColor = color;

      String sendColorr = color.toString().substring(10);
      sendColor = sendColorr.toString().substring(0, sendColorr.toString().length - 1);
      print(sendColor);

    })
  };
  void changeColors(List<Color> colors) => setState(() => currentColors = colors);

  String accestoken = accessTokenGlobal;

  bool _switchValue = false;
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
                    padding: const EdgeInsets.only(left: 13, bottom: 13,right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        'Text Color',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'SegoeUI-SemiBold'),
                      ),
                      GestureDetector(
                        onTap: () {
                                String url =
                                    'http://app.stalkme.co/${globalUrl}';
                                launch(url);
                              },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                            'PREVIEW',
                            style: TextStyle(
                              color: kPrimaryColor,
                                
                                fontSize: 14,
                                    fontFamily: 'SegoeUI-SemiBold',),
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
                    "Please choose your desired choice for the text color.",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'SegoeUI'),
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
                            onTap: (){
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            addBlockScreen()),
                                  );
                      },
                            child: Text(
                              'PREVIOUS',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 16, fontFamily: 'SegoeUI-SemiBold')
                            ),
                          ),
                           
                          GestureDetector(
                            onTap: () async {
                              // ignore: unnecessary_brace_in_string_interps
                              UpdatetextColor = currentColor;
                              //  Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => descriptionColorScreen()),
                              //     );                        
                        if (sendColor != "") {
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
                                  
String UpdatetextColorrr= currentColor.toString().substring(10);
          String UpdatetextColorApi = UpdatetextColorrr
              .toString()
              .substring(0, UpdatetextColorrr.toString().length - 1);
                                        String SocialColorr = socialColorGlobal.toString().substring(10);
          String SocialColorrApi = SocialColorr
              .toString()
              .substring(0, SocialColorr.toString().length - 1);


                                            


                          String sendColorrr11= sendColorrr1.toString().substring(10);
          String sendColorrr1Api = sendColorrr11
              .toString()
              .substring(0, sendColorrr11.toString().length - 1);


                   String sendColorrr22= sendColorrr2.toString().substring(10);
          String sendColorrr2Api = sendColorrr22
              .toString()
              .substring(0, sendColorrr22.toString().length - 1);



                   String sendColorrr33= sendColorrr3.toString().substring(10);
          String sendColorrr3Api = sendColorrr33
              .toString()
              .substring(0, sendColorrr33.toString().length - 1);


                                  Dio dio = new Dio();
                                  print(linkGlobal);
                                  print(accestoken);
                                  print(globalUrl);
                                  print('this color is sending #${sendColor}');
                                  FormData formData = FormData.fromMap({
                                    "request_type": "update",
                                    "type": "biolink",
                                    "title": UpdateTitle.toString(),
                                "description": UpdateDescription.toString(),
                                "display_verified": UpdateverifiedCheck ? 1 : 0,
                                "text_color":
                                    "#${UpdatetextColorApi}",
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
                                "socials_color":
                                    "#${SocialColorrApi}",
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
                                          builder: (context) =>
                                              descriptionColorScreen()),
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => profilePictureScreen()),
                                  // );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => descriptionColorScreen()),
                                  );
                                }
                      },  
                            child: Text(
                              'NEXT',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 16, fontFamily: 'SegoeUI-SemiBold')
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
                    GestureDetector(
                      onTap: (){
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
                                pickerAreaBorderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(2.0),
                                  topRight: const Radius.circular(2.0),
                                ),
                              ),
                            ),
                          );
                      });},
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
                    
                    
                    
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
