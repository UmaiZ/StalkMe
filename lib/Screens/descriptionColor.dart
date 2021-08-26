import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/fontScreen.dart';
import 'package:stalkme_project/Screens/socialScreen.dart';
import 'package:stalkme_project/Screens/textColor.dart';
import 'package:url_launcher/url_launcher.dart';
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
import 'addBlock.dart';
import 'descriptionScreen.dart';
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

class descriptionColorScreen extends StatefulWidget {
  @override
  _descriptionColorScreenState createState() => _descriptionColorScreenState();
}

class _descriptionColorScreenState extends State<descriptionColorScreen> {
  Color currentColor = sendColorrr1;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];


  String showValue = checkBackColor;
  String selectedColor = backGroudColor;
  String accestoken = accessTokenGlobal;
  String imageText = "SelecccImage.jpeg";


  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  File? imageFile;
                                                          _imgFromGallery() async {
                        final pickedFile =
                            await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

                        setState(() {
                          _imageFile = pickedFile;
                          imageFile = File(pickedFile!.path);
                          print(pickedFile.path);
                           imageText = basename(pickedFile.path);
                          print('t');
                          print(imageText);

                        });
                      }

  String sendColor ="";

  void changeColor(Color color) => {
        setState(() {
          print('here');
          currentColor = color;
          print(color);
               String sendColorr = color.toString().substring(10);
      sendColor = sendColorr.toString().substring(0, sendColorr.toString().length - 1);
            print("send color ${sendColor}");

        })
      };
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  Color currentColor2 = Color(0xff666666);

  String sendColor2 ="";


  void changeColor2(Color color) => {
        setState(() {
          currentColor2 = color;
          print(color);
                         String sendColorr2 = color.toString().substring(10);
      sendColor2 = sendColorr2.toString().substring(0, sendColorr2.toString().length - 1);
      print("send color 2 ${sendColor2}");
        })
      };

  Color currentColor3 = Color(0xff666666);
  String sendColor3 ="";

  void changeColor3(Color color) => {
        setState(() {
          currentColor3 = color;
          print(color);
                                   String sendColorr3 = color.toString().substring(10);
      sendColor3 = sendColorr3.toString().substring(0, sendColorr3.toString().length - 1);
      print("send color 3 ${sendColor3}");
        })
      };
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
                        'Background',
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
                    "Please select a background for your StalkMe profile.",
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
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            textColorScreen()),
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
                              checkBackColor = showValue;
                                backGroudColor =  selectedColor;
                                sendColorrr1 = currentColor;
                                sendColorrr2 = currentColor2;
                                sendColorrr3 = currentColor3;

                                print('sendColorrr1 ${sendColorrr1}');


//  Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               socialScreen()),
//                                     );

                             String SocialColorr = socialColorGlobal.toString().substring(10);
          String SocialColorrApi = SocialColorr
              .toString()
              .substring(0, SocialColorr.toString().length - 1);


                                               String UpdatetextColorrr= UpdatetextColor.toString().substring(10);
          String UpdatetextColorApi = UpdatetextColorrr
              .toString()
              .substring(0, UpdatetextColorrr.toString().length - 1);


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

              print('sendColorrr3Api ${sendColorrr3Api}');

                              if(showValue == "1"){

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
                                  print('preset ');
                                  print(selectedColor);
                                  

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
                                    "link_id": linkGlobal,
                                    "url": globalUrl,
                                    "background_type" : "preset",
                                    "background" : selectedColor
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
                                              socialScreen()),
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

                              }

 if(showValue == "2"){
   print('gradient ja rha ha');
      print('gradient ja rha ha ya #${sendColorrr1Api}  #${sendColorrr2Api}');


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
                                  print(linkGlobal);
                                  print(accestoken);
                                  print(globalUrl);
                                  FormData formData = FormData.fromMap({
                                    "request_type": "update",
                                    "type": "biolink",
                                    "link_id": linkGlobal,
                                    "title": UpdateTitle.toString(),
                                "description": UpdateDescription.toString(),
                                "display_verified": UpdateverifiedCheck ? 1 : 0,
"text_color": "#${UpdatetextColorApi}",                            
                                    "url": globalUrl,
                                    "background_type" : "gradient",
                                    "background" : ["#${sendColorrr1Api}", "#${sendColorrr2Api}"]
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
                                              socialScreen()),
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



                              }

                               if(showValue == "3"){

                                 print('color ja rha ha');
                                 print('checkBackColor ${checkBackColor}');
                                 print('ya ja rha ha #${sendColorrr1Api}');

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
                                  

                                  Dio dio = new Dio();
                                  print(linkGlobal);
                                  print(accestoken);
                                  print(globalUrl);


                                  FormData formData = FormData.fromMap({
                                    "request_type": "update",
                                    "type": "biolink",
                                    "link_id": linkGlobal,
                                    "url": globalUrl,
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
                                "font": FontGlobal
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
                                              socialScreen()),
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



                              }


                                                            if(showValue == "4"){

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
                                  

                                  Dio dio = new Dio();
                                  print(linkGlobal);
                                  print(accestoken);
                                  print(globalUrl);
                                  FormData formData = FormData.fromMap({
                                    "request_type": "update",
                                    "type": "biolink",
                                    "link_id": linkGlobal,
                                    "url": globalUrl,
                                    "title": UpdateTitle.toString(),
                                "description": UpdateDescription.toString(),
                                "display_verified": UpdateverifiedCheck ? 1 : 0,
"text_color": "#${UpdatetextColorApi}",                            
                                    "background_type" : "Image",
                                    "background": await MultipartFile.fromFile(
                                      _imageFile!.path,
                                      filename: _imageFile!.path.toString()),
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
                                              socialScreen()),
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



                              }


                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => socialScreen()),
                              // );
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Container(
                          width: Width * 0.9,
                          child: DropdownButtonFormField(
                            hint: Text(
                              hintColor,
                              style: TextStyle(
                                  color: textGreyColor, fontFamily: 'SegoeUI'),
                            ), // Not necessary for Option 1

                            items: [
                              {"value": "1", "label": "Preset"},
                              {"value": "2", "label": "Custom Gradient"},
                              {"value": "3", "label": "Custom Color"},
                              {"value": "4", "label": "Custom Image"},
                            ].map((category) {
                              return new DropdownMenuItem(
                                  value: category['value'],
                                  child: Text(
                                    category['label'].toString(),
                                    style: TextStyle(
                                        color: Color(0xffbdbdbd),
                                        fontFamily: 'UbuntuRegular'),
                                  ));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                showValue = newValue.toString();
                                if(newValue.toString() == "1"){
                                  hintColor  = "Preset";

                                }
                                if(newValue.toString() == "2"){
                                  hintColor  = "Custom Gradient";

                                }
                                if(newValue.toString() == "3"){
                                  hintColor  = "Custom Color";

                                }
                                if(newValue.toString() == "4"){
                                  hintColor  = "Custom Image";

                                }
                              });
                            },
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffE6E6E6), width: 1),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffE6E6E6), width: 1),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(
                                  color: Color(0xffbdbdbd),
                                  fontFamily: 'UbuntuRegular'),
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kPrimaryColor, width: 1),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    showValue == "1"
                        ? Container(
                            width: Width * 0.9,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Height * 0.03,
                                ),
                                Wrap(
                                  spacing: 15.0, // gap between adjacent chips
                                  runSpacing: 15.0, // gap between lines
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "one";
                                        });
                                      },
                                      child: Container(
                                          decoration: selectedColor == "one"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                            'images/Color1.svg',
                                            width: Width * 0.27,
                                            height: Height * 0.125,
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "two";
                                          
                                        });
                                      },
                                      child: Container(
                                              decoration: selectedColor == "two"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                        'images/Color2.svg',
                                        width: Width * 0.27,
                                        height: Height * 0.125,
                                      )),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "three";
                                        });
                                      },
                                      child: Container(
                                                                               decoration: selectedColor == "three"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                        'images/Color3.svg',
                                        width: Width * 0.27,
                                        height: Height * 0.125,
                                      )),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "four";
                                        });
                                      },
                                      child: Container(
                                                                               decoration: selectedColor == "four"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                        'images/Color4.svg',
                                        width: Width * 0.27,
                                        height: Height * 0.125,
                                      )),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "five";
                                        });
                                      },
                                      child: Container(
                                                                               decoration: selectedColor == "five"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                        'images/Color5.svg',
                                        width: Width * 0.27,
                                        height: Height * 0.125,
                                      )),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedColor = "six";
                                        });
                                      },
                                      child: Container(
                                                                               decoration: selectedColor == "six"
                                              ? BoxDecoration(
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))
                                              : null,
                                          child: SvgPicture.asset(
                                        'images/Color6.svg',
                                        width: Width * 0.27,
                                        height: Height * 0.125,
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    showValue == "2"
                        ? Column(
                            children: [
                              SizedBox(
                                height: Height * 0.01,
                              ),
                              Container(
                                width: Width * 0.9,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Color 1',
                                    style: TextStyle(
                                        color: textGreyColor, fontSize: 15),
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
                                          titlePadding:
                                              const EdgeInsets.all(0.0),
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
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
                                                topLeft:
                                                    const Radius.circular(2.0),
                                                topRight:
                                                    const Radius.circular(2.0),
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
                                      border:
                                          Border.all(color: Color(0xffE6E6E6))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    'Color 2',
                                    style: TextStyle(
                                        color: textGreyColor, fontSize: 15),
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
                                          titlePadding:
                                              const EdgeInsets.all(0.0),
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          content: SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: currentColor2,
                                              onColorChanged: changeColor2,
                                              colorPickerWidth: 300.0,
                                              pickerAreaHeightPercent: 0.7,
                                              enableAlpha: false,
                                              displayThumbColor: true,
                                              showLabel: false,
                                              paletteType: PaletteType.hsv,
                                              pickerAreaBorderRadius:
                                                  const BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(2.0),
                                                topRight:
                                                    const Radius.circular(2.0),
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
                                      border:
                                          Border.all(color: Color(0xffE6E6E6))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: currentColor2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    showValue == "3"
                        ? Column(
                            children: [
                              SizedBox(
                                height: Height * 0.01,
                              ),
                              Container(
                                width: Width * 0.9,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Custom Color',
                                    style: TextStyle(
                                        color: textGreyColor, fontSize: 15),
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
                                          titlePadding:
                                              const EdgeInsets.all(0.0),
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
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
                                                topLeft:
                                                    const Radius.circular(2.0),
                                                topRight:
                                                    const Radius.circular(2.0),
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
                                      border:
                                          Border.all(color: Color(0xffE6E6E6))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: currentColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    showValue == "4"
                        ? Column(
                            children: [
                              SizedBox(
                                height: Height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 11, left: 17, right: 17),
                                child: Container(
                                  height: Height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Color(0xffE6E6E6))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(imageText.toString().substring(imageText.length - 10),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: textGreyColor,
                                            )),
                                        GestureDetector(
                                          onTap: (){
                                            _imgFromGallery();
                                          },
                                          child: Container(
                                            height: Height * 0.04,
                                            width: Width * 0.2,
                                            decoration: BoxDecoration(
                                                color: Color(0xffE6E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xffE6E6E6))),
                                            child: Center(
                                                child: Text(
                                              'Browse',
                                              style: TextStyle(
                                                  color: textGreyColor,
                                                  fontSize: 12),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container()
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
