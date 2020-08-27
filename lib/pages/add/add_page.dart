import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phonebookfortheelderly/common/contact_model.dart';
import 'package:phonebookfortheelderly/common/data_utils.dart';
import 'package:phonebookfortheelderly/common/v_colors.dart';
import 'package:uuid/uuid.dart';

/// 新增联系人
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String name;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('添加联系人'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  _addPerson();
                  Navigator.of(context).pop();
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: null),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: VColors.mainColor,
                ),
                hintText: '请输入名字',
              ),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                setState(() {
                  name = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: VColors.mainColor,
                  ),
                  hintText: '请输入手机号码'),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
              ],
              onChanged: (text) {
                setState(() {
                  phoneNumber = text;
                });
              },
            ),
          ],
        ));
  }

  /// 添加联系人
  _addPerson() async {
    if (name != null &&
        name.isNotEmpty &&
        phoneNumber != null &&
        phoneNumber.isNotEmpty) {
      await DataUtils.save(ContactModel(Uuid().v1(), name, [phoneNumber]));
    }
  }
}
