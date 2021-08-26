import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stalkme_project/Helper/colors.dart';
import 'dart:typed_data';

import 'login.dart';
import 'package:nfc_manager/nfc_manager.dart';

class createSticker extends StatefulWidget {
  @override
  _createStickerState createState() => _createStickerState();
}

class _createStickerState extends State<createSticker> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  TextEditingController nfcUrl = TextEditingController();

  _ndefWrite() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    print('isAvailable');
    print(isAvailable);
    if (isAvailable) {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null || !ndef.isWritable) {
          print('Tag is not ndef writable');
          result.value = 'Tag is not ndef writable';
          NfcManager.instance.stopSession(errorMessage: result.value);
          return;
        }

        NdefMessage message = NdefMessage([
          NdefRecord.createUri(Uri.parse(
              "https://www.app.stalkme.co/${nfcUrl.text.toString()}")),
        ]);

        try {
          await ndef.write(message);
          result.value = 'Success to "Ndef Write"';
                    print('Success to "Ndef Write');

          NfcManager.instance.stopSession();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("Sucessfully written url to Tag",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontFamily: 'SegoeUI-SemiBold')),
                actions: [
                  TextButton(
                    child: Text("OK",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: 'SegoeUI-SemiBold')),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        } catch (e) {
          result.value = e;
          NfcManager.instance
              .stopSession(errorMessage: result.value.toString());
          return;
        }
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Device not supported NFC",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontFamily: 'SegoeUI-SemiBold')),
            actions: [
              TextButton(
                child: Text("OK",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontFamily: 'SegoeUI-SemiBold')),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
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
                  padding: const EdgeInsets.only(left: 13, bottom: 13),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create Sticker',
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
                child: Column(
                  children: [
                    SizedBox(
                      height: Height * 0.05,
                    ),
                    Container(
                        height: Height * 0.05,
                        width: Width * 1,
                        child: SvgPicture.asset('images/logo.svg')),
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
                              width: Width * 0.56,
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
                          width: Width * 0.34,
                            height: 55,
                          child: TextFormField(
                            
                            controller: nfcUrl,
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
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: Width * 0.9,
                        child: Center(
                          child: Text(
                            "Hold Phone Over Your Sticker And Press Button",
                            style: TextStyle(
                                color: textGreyColor,
                                fontSize: 16,
                                fontFamily: 'SegoeUI'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                      onTap: () {
                        _ndefWrite();
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
                              'WRITE STICKER',
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
