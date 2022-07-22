import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beconsent_sdk/model/Consent.dart';
import 'package:beconsent_sdk/model/record_consent.dart';
import 'package:beconsent_sdk/model/globals.dart' as global;

class create_toggle extends StatefulWidget {
  late Consent _c;
  create_toggle(Consent c) {
    _c = c;
  }
  @override
  State<StatefulWidget> createState() {
    return _create_toggleState(_c);
  }
}

class _create_toggleState extends State<create_toggle> {
  _create_toggleState(Consent c) {
    _c = c;
  }

  late Consent _c;
  late var controller;
  late String lang = _c.defaultLanguage;
  bool val = false;

  add_index() {
    if (!global.record.isEmpty) {
    } else {
      for (var i in _c.purposes) {
        if (i.primary == true) {
          if (lang == 'th') {
            consent_record rec = consent_record(
                id: i.id,
                uuid: i.uuid,
                val: true,
                name: i.title.th,
                description: i.description.th,
                primary: i.primary,
                isSelected: false);
            global.record.add(rec);
            global.Decline = "ปฏิเสธค่าที่ไม่จำเป็น";
            // global.Accept = "ยอมรับทั้งหมด";
          } else {
            consent_record rec = consent_record(
                id: i.id,
                uuid: i.uuid,
                val: true,
                name: i.title.en,
                description: i.description.en,
                primary: i.primary,
                isSelected: false);
            global.record.add(rec);
            global.Decline = "Decline Additions";
            // global.Accept = "Accept All";
          }
        } else {
          if (lang == 'th') {
            consent_record rec = consent_record(
                id: i.id,
                uuid: i.uuid,
                val: val,
                name: i.title.th,
                description: i.description.th,
                primary: i.primary,
                isSelected: false);
            global.record.add(rec);
            // global.Decline = "ปฏิเสธ";
            // global.Accept = "ยอมรับทั้งหมด";
          } else {
            consent_record rec = consent_record(
                id: i.id,
                uuid: i.uuid,
                val: val,
                name: i.title.en,
                description: i.description.en,
                primary: i.primary,
                isSelected: false);
            global.record.add(rec);
            // global.Decline = "Decline";
            // global.Accept = "Accept All";
          }
        }
      }
    }
  }

  @override
  void initState() {
    add_index();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: global.record.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(global.record[i].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              subtitle: global.record[i].isSelected
                  ? Text(global.record[i].description)
                  : null,
              trailing: CupertinoSwitch(
                  value: global.record[i].val,
                  onChanged: global.record[i].primary
                      ? null
                      : (newValue) {
                          setState(() {
                            global.record[i].val = newValue;
                            global.toggle_true = newValue;
                          });
                        },
                  trackColor: Colors.grey,
                  activeColor: Colors.blue),
              onTap: () {
                setState(() {
                  if (global.record[i].isSelected == false) {
                    global.record[i].isSelected = true;
                  } else {
                    global.record[i].isSelected = false;
                  }
                });
              },
            ),
          );
        });
  }
}
