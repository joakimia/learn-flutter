import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'package:app/services/service_locator.dart';
import 'package:app/core/home.dart';
import 'package:app/shared/constants/bottom_nav_bar_tab_index.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/shared/widgets/tab_navigator.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/borders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  initServiceLocator(); // Inject services

  runApp(const EldelApp());
}

class EldelApp extends StatefulWidget {
  const EldelApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EldelAppState();
  }
}

class _EldelAppState extends State<EldelApp> {
  var _selectedTabIndex = chargePointsTabIndex;

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: eldelLabel,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColorPrimary,
        backgroundColor: backgroundColorSecondary,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: eldelColorTransparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadiusSmall)))),
      ),
      home: Home(
        selectedTabIndex: _selectedTabIndex,
        onBottomNavBarItemTapped: _onBottomNavBarItemTapped,
      ));

  void _onBottomNavBarItemTapped(int selectedTabIndex) {
    if (selectedTabIndex == _selectedTabIndex) {
      navigatorKeys[selectedTabIndex]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedTabIndex = selectedTabIndex;
      });
    }
  }
}
