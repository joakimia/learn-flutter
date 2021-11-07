import 'package:flutter/material.dart';

import 'package:app/shared/constants/bottom_nav_bar_tab_index.dart';
import 'package:app/screens/charge_points/charge_points.dart';
import 'package:app/screens/favourites/favourites.dart';
import 'package:app/screens/messages/messages.dart';
import 'package:app/screens/my_account/my_account.dart';

Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
  favouritesTabIndex: GlobalKey<NavigatorState>(),
  chargePointsTabIndex: GlobalKey<NavigatorState>(),
  messagesTabIndex: GlobalKey<NavigatorState>(),
  myAccountTabIndex: GlobalKey<NavigatorState>(),
};

class EldelTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? _navigatorKey;
  final int _selectedTabIndex;

  const EldelTabNavigator(
      {Key? key,
      required GlobalKey<NavigatorState>? navigatorKey,
      required int selectedTabIndex})
      : _selectedTabIndex = selectedTabIndex,
        _navigatorKey = navigatorKey,
        super(key: key);

  @override
  Widget build(BuildContext context) =>  Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) =>
            MaterialPageRoute(builder: (context) => _getCurrentTab()));

  Widget _getCurrentTab() {
    switch (_selectedTabIndex) {
      case favouritesTabIndex:
        return const Favourites();
      case chargePointsTabIndex:
        return ChargePoints();
      case messagesTabIndex:
        return const Messages();
      case myAccountTabIndex:
        return const MyAccount();
      default:
        return ChargePoints();
    }
  }
}
