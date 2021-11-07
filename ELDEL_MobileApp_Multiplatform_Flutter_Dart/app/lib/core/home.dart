import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'package:app/shared/constants/bottom_nav_bar_tab_index.dart';
import 'package:app/shared/widgets/tab_navigator.dart';

class Home extends StatelessWidget {
  final int _selectedTabIndex;
  final ValueChanged<int> _onBottomNavBarItemTapped;

  const Home({
    Key? key,
    required int selectedTabIndex,
    required ValueChanged<int> onBottomNavBarItemTapped,
  })  : _selectedTabIndex = selectedTabIndex,
        _onBottomNavBarItemTapped = onBottomNavBarItemTapped,
        super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: _onWillPopOnAndroid,
    child: Scaffold(
      body: Stack(children: <Widget>[
        _getOffstageNavigatorByLabel(favouritesTabIndex),
        _getOffstageNavigatorByLabel(chargePointsTabIndex),
        _getOffstageNavigatorByLabel(messagesTabIndex),
        _getOffstageNavigatorByLabel(myAccountTabIndex),
      ]),
      bottomNavigationBar: BottomNavBar(
        selectedTabIndex: _selectedTabIndex,
        onBottomNavBarItemTapped: _onBottomNavBarItemTapped,
      ),
    ),
  );

  Widget _getOffstageNavigatorByLabel(int tabItemIndex) => Offstage(
    offstage: _selectedTabIndex != tabItemIndex,
    child: EldelTabNavigator(
      navigatorKey: navigatorKeys[tabItemIndex],
      selectedTabIndex: tabItemIndex,
    ),
  );

  // Back button on android will close the app, instead of going back to previous page.
  // This function checks if there is any pages to pop, before ultimately closing the app.
  Future<bool> _onWillPopOnAndroid() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[_selectedTabIndex]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (_selectedTabIndex != chargePointsTabIndex) {
        _onBottomNavBarItemTapped(chargePointsTabIndex);

        return false;
      }
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }
}
