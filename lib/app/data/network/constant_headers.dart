

import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/enum/header_type.dart';

class ConstantHeaders {
  static Map<String, String> fetchHeaders(HeaderType headerType) {
    Map<String, String> header;

    switch (headerType) {
      case HeaderType.MULTIPART:
        header = {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json"
        };
        break;

      case HeaderType.HEADER_WITH_TOKEN:
        header = {
          'Content-Type': 'application/json',
          "Accept": "application/json",
          "Authorization": "Bearer ${SessionManager.instance.accessToken}"
        };
        break;

      case HeaderType.MULTIPART_WITH_TOKEN:
        header = {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
          "Authorization": "Bearer ${SessionManager.instance.accessToken}"
        };
        break;

      case HeaderType.HEADER_WITH_USER_TYPE:
        header = {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "user-type": "customer",
          "Authorization": "Bearer ${SessionManager.instance.accessToken}"
        };
        break;
    }

    return header;
  }
}
