import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Helper/global.dart';
import 'package:stalkme_project/Screens/createSticker.dart';
import 'package:stalkme_project/Screens/profilePicture.dart';
import 'package:stalkme_project/main.dart';

import 'createLink.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'package:stalkme_project/Screens/getStarted.dart';

import 'login.dart';
import 'package:http/http.dart' as http;

class getStartedScreen extends StatefulWidget {
  @override
  _getStartedScreenState createState() => _getStartedScreenState();
}

class _getStartedScreenState extends State<getStartedScreen> {
  bool _switchValue = false;
  String accestoken = accessTokenGlobal;
  var LinkData = [];

  var checkSwitch = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getNot();
    });
  }

  getNot() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
              child: SpinKitWave(
                  color: kPrimaryColor, type: SpinKitWaveType.center));
        });
    var map = new Map<String, dynamic>();

    var url = 'https://app.stalkme.co/api/links?page=1&results_per_page=50';
    print(url);
    http.Response res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accestoken'
      },
    );
    var data = json.decode(res.body.toString());
    print(data);
    setState(() {
      LinkData = data['data'];
    });

    for (var res in LinkData) {
      if (res['is_enabled'] == 1) {
        checkSwitch.add(true);
      } else {
        checkSwitch.add(false);
      }
    }
    print(checkSwitch);
    Navigator.pop(context);
    print(LinkData.length);
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
            width: double.infinity,
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
                    "Get started with creating your first link or view the links you already created.",
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
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final _storage = FlutterSecureStorage();

                        await _storage.write(
                            key: 'accessTokenLocal', value: "");
                        await _storage.write(key: 'isLogin', value: "no");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 17, right: 17, bottom: 17),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('LOGOUT',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI-SemiBold'))),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffE6E6E6),
                    ),
                    Container(
                      height: Height * 0.45,
                      width: Width * 0.9,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: LinkData.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                print('data');
                                print(LinkData[i]);
                                linkGlobal = LinkData[i]['id'];
                                globalUrl = LinkData[i]['url'] != null
                                    ? LinkData[i]['url']
                                    : "";

                                UpdateTitle = LinkData[i]['settings']['title']
                                    .toString()
                                    .replaceAll("&#39;", "'");

                                ImageUrlGlobal =
                                    LinkData[i]['settings']['image'].toString();
                                UpdateDescription = LinkData[i]['settings']
                                        ['description']
                                    .toString()
                                    .replaceAll("&#39;", "'");
                                UpdateverifiedCheck =
                                    LinkData[i]['settings']['display_verified'];
                                UpdatetextColor = LinkData[i]['settings']
                                                ['text_color']
                                            .toString() ==
                                        "#fff"
                                    ? Color(0xffffffff)
                                    : Color(int.parse(LinkData[i]['settings']
                                            ['text_color']
                                        .toString()
                                        .replaceFirst('#', '0xFF')));
                                UpdatebuttonColor = LinkData[i]['settings']
                                                ['socials_color']
                                            .toString() ==
                                        "#fff"
                                    ? Color(0xffffffff)
                                    : Color(int.parse(LinkData[i]['settings']
                                            ['socials_color']
                                        .toString()
                                        .replaceFirst('#', '0xFF')));
                                socialColorGlobal = LinkData[i]['settings']
                                                ['socials_color']
                                            .toString() ==
                                        "#fff"
                                    ? Color(0xffffffff)
                                    : Color(int.parse(LinkData[i]['settings']
                                            ['socials_color']
                                        .toString()
                                        .replaceFirst('#', '0xFF')));

                                UpdateEmail =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['email']
                                        : "";
                                UpdateTelephone =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['tel']
                                        : "";
                                UpdateTelegram =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['telegram']
                                        : "";
                                UpdateWhatsApp =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['whatsapp']
                                        : "";
                                UpdateFacebook =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['facebook']
                                        : "";
                                UpdateFacebookMessenger =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['facebook-messenger']
                                        : "";
                                UpdateInstagram =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['instagram']
                                        : "";
                                UpdateTwitter =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['twitter']
                                        : "";
                                UpdateTiktok =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['tiktok']
                                        : "";
                                UpdateYoutube =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['youtube']
                                        : "";
                                UpdateSoundCloud =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['soundcloud']
                                        : "";
                                UpdateLinkdin =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['linkedin']
                                        : "";
                                UpdateSpotify =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['spotify']
                                        : "";
                                UpdatePinterest =
                                    LinkData[i]['settings']['socials'] != null
                                        ? LinkData[i]['settings']['socials']
                                            ['pinterest']
                                        : "";
                                BlocksArray = LinkData[i]['biolinks_blocks'];
                                hintColor = LinkData[i]['settings']
                                                ['background_type']
                                            .toString() ==
                                        "color"
                                    ? "Custom Color"
                                    : LinkData[i]['settings']['background_type']
                                                .toString() ==
                                            "preset"
                                        ? "Preset"
                                        : LinkData[i]['settings']
                                                        ['background_type']
                                                    .toString() ==
                                                "gradient"
                                            ? "Custom Gradient"
                                            : "";
                                checkBackColor = LinkData[i]['settings']
                                                ['background_type']
                                            .toString() ==
                                        "preset"
                                    ? "1"
                                    : LinkData[i]['settings']['background_type']
                                                .toString() ==
                                            "gradient"
                                        ? "2"
                                        : LinkData[i]['settings']
                                                        ['background_type']
                                                    .toString() ==
                                                "color"
                                            ? "3"
                                            : "0";
                                backGroudColor = LinkData[i]['settings']
                                                ['background_type']
                                            .toString() ==
                                        "preset"
                                    ? LinkData[i]['settings']['background']
                                        .toString()
                                    : "one";
                                sendColorrr1 = LinkData[i]['settings']
                                                ['background_type']
                                            .toString() ==
                                        "color"
                                    ? Color(int.parse(LinkData[i]['settings']
                                            ['background']
                                        .toString()
                                        .replaceFirst('#', '0xFF')))
                                    : Color(0xffffffff);

                                print('UpdateTelegram ${UpdateTelegram}');
                                print('ads ${sendColorrr1}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          profilePictureScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  child: Container(
                                    height: Height * 0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Color(0xffE6E6E6))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13, right: 13),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    child: SvgPicture.asset(
                                                        'images/clip.svg')),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      LinkData[i]['url']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'SegoeUI-SemiBold',
                                                        color: textGreyColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      'https://stalkme.co/${LinkData[i]['url'].toString()}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'SemiBold',
                                                          color: textGreyColor),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            FlutterSwitch(
                                              width: 52,
                                              height: 32.5,
                                              valueFontSize: 12.0,
                                              toggleSize: 20.0,
                                              toggleColor: checkSwitch[i]
                                                  ? Colors.white
                                                  : Color(0xffE6E6E6),
                                              switchBorder: Border.all(
                                                color: Color(0xffE6E6E6),
                                                width: checkSwitch[i] ? 0 : 1.0,
                                              ),
                                              activeColor: kPrimaryColor,
                                              inactiveColor: Colors.white,
                                              value: checkSwitch[i],
                                              onToggle: (val) async {
                                                print(val);
                                                setState(() {
                                                  checkSwitch[i] =
                                                      !checkSwitch[i];
                                                });

                                                //             showDialog(
                                                // context: context,
                                                // barrierDismissible: false,
                                                // builder: (BuildContext context) {
                                                //   return Center(
                                                //       child: SpinKitWave(
                                                //           color: kPrimaryColor,
                                                //           type: SpinKitWaveType.center));
                                                // });
                                                print('continue');
                                                print(linkGlobal);
                                                print(accestoken);
                                                Dio dio = new Dio();

                                                FormData formData =
                                                    FormData.fromMap({
                                                  "request_type":
                                                      "is_enabled_toggle",
                                                  "type": "biolink",
                                                  "link_id": LinkData[i]['id'],
                                                  "url": LinkData[i]['url']
                                                });
                                                dio.options.headers[
                                                        'content-Type'] =
                                                    'application/x-www-form-urlencoded';
                                                dio.options.headers[
                                                        "authorization"] =
                                                    "Bearer ${accestoken}";
                                                var response = await dio.post(
                                                    'https://app.stalkme.co/api/update_biolink',
                                                    data: formData);
                                                print(response);
                                                var data = json.decode(
                                                    response.toString());

                                                print(data);
                                                // if (data['status'].toString() == "success") {
                                                //   Navigator.pop(context);

                                                //   Fluttertoast.showToast(
                                                //       msg: data['message'][0].toString(),
                                                //       toastLength: Toast.LENGTH_SHORT,
                                                //       gravity: ToastGravity.BOTTOM,
                                                //       timeInSecForIosWeb: 1,
                                                //       backgroundColor: kPrimaryColor,
                                                //       textColor: Colors.white,
                                                //       fontSize: 16.0);

                                                // }
                                              },
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        linkGlobal = 0;
                        globalUrl = "";

                        UpdateTitle = "";
                        UpdateDescription = "";
                        UpdateverifiedCheck = false;
                        UpdatetextColor = Color(0xff666666);
                        UpdatebuttonColor = Color(0xff666666);

                        UpdateEmail = "";
                        UpdateTelephone = "";
                        UpdateTelegram = "";
                        UpdateWhatsApp = "";
                        UpdateFacebook = "";
                        UpdateFacebookMessenger = "";
                        UpdateInstagram = "";
                        UpdateTwitter = "";
                        UpdateTiktok = "";
                        UpdateYoutube = "";
                        UpdateSoundCloud = "";
                        UpdateLinkdin = "";
                        UpdateSpotify = "";
                        UpdatePinterest = "";
                        BlocksArray = [];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => createlinkScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 10),
                        child: Container(
                          width: Width * 0.9,
                          height: Height * 0.06,
                          decoration: BoxDecoration(
                              color: Color(0xffebf7f7),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'CREATE PROFILE PAGE',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontFamily: 'SegoeUI'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Login print');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => createSticker()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          width: Width * 0.9,
                          height: Height * 0.06,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'CREATE STICKER',
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
        ],
      ),
    );
  }
}
