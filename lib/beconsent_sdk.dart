library beconsent_sdk;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beconsent_sdk/model/beconsent_info.dart' as response;
import 'package:beconsent_sdk/model/toggle_switch.dart';
import 'package:beconsent_sdk/model/getWorkspace.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;

AssetImage logo = AssetImage('img/beconsent_logo.png');

Dataload() async {
  String? uuid = await response.beconsent_api().getuuid();
  return uuid;
}

press(var context) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) => BeConsent(),
  );
}

class BeConsent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BeConsentState();
  }
}

class _BeConsentState extends State<BeConsent> {
  int? code;
  var consent = ['1', '2', '3', '4'];
  late GetWorkspace _ws;
  add_toogle() {
    for (int i = 0; i < consent.length; i++) {
      toggle_switch('$i[i]');
    }
  }

  String Decline = 'Decline';
  // changestate(bool newv) {
  //   setState(() {
  //     val = newv;
  //   });
  //   if (val == true) {
  //     Decline = 'Save Setting';
  //   } else {
  //     Decline = 'Decline';
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                child: Column(
              children: [
                Text(
                  'MUTSARI DELIVERY User Data Collection Consent',
                  style: TextStyle(fontSize: 20, fontFamily: 'Kanit'),
                ),
                Text(
                    'to store information MUTSARI DELIVERY User Data Collection Consent'),
              ],
            )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  toggle_switch('collect user information')
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => cancel(),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                    child: Text('$Decline'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => Accept(),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      child: Text("Accept All"))
                ],
              ),
            ),
            Container(
              child: Image(image: logo),
            )
          ],
        ));
  }

  void cancel() {
    print("press cancel");
    Navigator.of(context).pop();
  }

  void Accept() {
    print("press Accept");
    // setState(() {
    //   Future<String?> uuid = response.beconsent_api().getStatus();
    //   print('$uuid');
    // });
    Navigator.of(context).pop();
  }
}
