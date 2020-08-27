import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phonebookfortheelderly/common/log_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// 打电话
  static Future<void> makePhoneCall(phoneNum) async {
    String url = 'tel:$phoneNum';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      LogUtils.d('could not launch $url');
    }
  }

  /// 选择相册图片
  static Future<PickedFile> pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    LogUtils.d("pickImage：" + pickedFile.path);
    return pickedFile;
  }

  /// 拷贝文件
  static Future<File> copyFile(String from, String to) async {
    return await File(from).copy(to);
  }

  /// 拷贝头像照片
  static Future<File> copyAvatar(String filePath) async {
    if (filePath == null || filePath.isEmpty) {
      return null;
    }
    //获取应用内的存储文件夹地址
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String avatarDoc = '$appDocPath/avatars';
    Directory directory = new Directory(avatarDoc);
    bool docExist = await directory.exists();
    if (!docExist) {
      directory.create();
    }
    String newFilePath =
        '$appDocPath/avatars/${DateTime.now().millisecondsSinceEpoch}.jpg';
    bool exist = await File(newFilePath).exists();
    if (exist) {
      File(newFilePath).delete();
    }
    File file = await copyFile(filePath, newFilePath);
    if (file != null && file.path != null && file.path.isNotEmpty) {
      LogUtils.d('copyAvatar：' + file.path);
      return file;
    } else {
      return null;
    }
  }
}
