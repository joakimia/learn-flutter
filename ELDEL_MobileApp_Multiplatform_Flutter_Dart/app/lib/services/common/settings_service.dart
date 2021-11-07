import 'package:flutter_config/flutter_config.dart';

class SettingsService {

  String get eldelAPIChargersApiKey {
    return FlutterConfig.get('ELDEL_API_CHARGERS_API_KEY') ?? '';
  }

  String get eldelAPIBaseUrl {
    return FlutterConfig.get('ELDEL_API_BASE_URL') ?? '';
  }
}

SettingsService settingsService = SettingsService();