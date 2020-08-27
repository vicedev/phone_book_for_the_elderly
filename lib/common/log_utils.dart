import 'dart:developer';

/// log工具类
class LogUtils {
  static final String tagV = 'LogUtils';

  static d(String msg, [String tag]) {
    log('${(tag == null || tag.isEmpty) ? tagV : tag}：$msg');
  }
}
