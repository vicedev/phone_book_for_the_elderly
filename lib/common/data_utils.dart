import 'dart:convert';

import 'package:phonebookfortheelderly/common/log_utils.dart';
import 'package:phonebookfortheelderly/common/sp_utils.dart';

import 'contact_model.dart';

/// 用于存通讯录数据
class DataUtils {
  static final String _phoneBookData = 'phone_book_data';

  static Future<void> save(ContactModel contactModel) async {
    if (contactModel == null ||
        contactModel.id == null ||
        contactModel.id.isEmpty) {
      return;
    }
    List<ContactModel> contacts = await queryAll();
    bool findLocal = false;
    if (contacts != null && contacts.length > 0) {
      for (int i = 0; i < contacts.length; i++) {
        ContactModel findContact = contacts[i];
        if (findContact != null && findContact.id == contactModel.id) {
          contacts[i] = contactModel;
          //发现本地已经存在了，更新后重新存到本地
          findLocal = true;
          await SPUtils.save(_phoneBookData, jsonEncode(contacts));
          break;
        }
      }
    }
    if (!findLocal) {
      //本地没找到，新加一个保存到本地
      if (contacts == null) {
        contacts = List();
      }
      contacts.add(contactModel);
      LogUtils.d(jsonEncode(contacts));
      await SPUtils.save(_phoneBookData, jsonEncode(contacts));
    }
  }

  static Future<List<ContactModel>> queryAll() async {
    String json = await SPUtils.get(_phoneBookData);
    List<ContactModel> contacts;
    try {
      contacts = jsonDecode(json);
    } catch (e) {
      print(e);
    }
    return contacts;
  }
}
