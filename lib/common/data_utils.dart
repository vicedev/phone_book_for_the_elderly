import 'package:phonebookfortheelderly/common/sp_utils.dart';

/// 用于存主要数据
class DataUtils {
  static final String _keyData = 'key_data';

  static Future<void> save(String value) async {
    await SPUtils.save(_keyData, value);
  }

  static Future<String> get() async {
    return SPUtils.get(_keyData);
  }
}
