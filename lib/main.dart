import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stalkme_project/Helper/global.dart';

import 'Helper/colors.dart';
import 'Screens/createAccount.dart';
import 'Screens/createSticker.dart';
import 'Screens/getStarted.dart';
import 'Screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StalkMe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loginYes = false;

  @override
  void initState() {
    uninstallcheck();
  }

  uninstallcheck() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs);
    print(prefs.getBool('first_run'));

    if (prefs.getBool('first_run') ?? true) {
      FlutterSecureStorage storage = FlutterSecureStorage();

      await storage.deleteAll();

      prefs.setBool('first_run', false);
            checkLogin();

    }
    else{
      checkLogin();
    }
  }

  checkLogin() async {
    final storage = new FlutterSecureStorage();

    String? checkLogin = await storage.read(key: "isLogin");
    print('checkLogin');
    print(checkLogin);

    if (checkLogin == "yes") {
      String? access = await storage.read(key: "accessTokenLocal");
      print(access);
      accessTokenGlobal = access.toString();
      setState(() {
        loginYes = true;
      });
      Timer(Duration(seconds: 4), () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => getStartedScreen()),
        );
      });
    } else {
      Timer(Duration(seconds: 4), () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double stackWidth = MediaQuery.of(context).size.width;
    double stackHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Center(child: SvgPicture.asset('images/logo.svg')),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      'Welcome User',
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
                    "Please choose whether you'd like to create a sticker or create your StalkMe profile.",
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
                    SizedBox(
                      height: Height * 0.05,
                    ),
                    Container(
                        height: Height * 0.375,
                        width: Width * 1,
                        child: SvgPicture.asset('images/Firstillustimage.svg')),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print('Login print');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => createSticker()),
                        );
                      },
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
                    GestureDetector(
                      onTap: () {
                        print('Login print');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccountScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: Width * 0.9,
                          height: Height * 0.06,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'CREATE ACCOUNT',
                              style: TextStyle(
                                  color: Colors.white,
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
                              builder: (context) => LoginScreen()),
                        );
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
        ],
      ),
    );
  }
}
