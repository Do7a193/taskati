import 'package:hive_flutter/hive_flutter.dart';

class AppLocalSotrage {
  static String kIsUpload = 'isUpload';
  static String kName = 'name';
  static String kImage = 'image';

  static late Box userBox;
 //static late Box taskBox;
  static init() {
    userBox = Hive.box('userBox');
   // taskBox = Hive.box('taskBox');
  }

  static cachData(String key, value) {
    userBox.put(key, value);
  }

  static getCachData(String key) {
    return userBox.get(key);
  }
}
