import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;


  static String getBaseUrl() {
    return dotenv.env['API_BASE_URL'];
  }

  static String getAgoraID(){
    return dotenv.env['AGORA_APP_ID'];
  }

}