import 'package:flutter/material.dart';

import 'package:app/shared/constants/bottom_nav_bar_tab_index.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/font.dart';

class BottomNavBar extends StatelessWidget {
  final int _selectedTabIndex;
  final ValueChanged<int> _onNavBarItemTapped;

  const BottomNavBar({
    Key? key,
    required final int selectedTabIndex,
    required final ValueChanged<int> onBottomNavBarItemTapped,
  })  : _onNavBarItemTapped = onBottomNavBarItemTapped,
        _selectedTabIndex = selectedTabIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    selectedFontSize: fontSizeSmall,
    unselectedFontSize: fontSizeSmall,
    selectedItemColor: iconColorPrimary,
    unselectedItemColor: iconColorSecondary,
    type: BottomNavigationBarType.fixed,
    backgroundColor: backgroundColorSecondary,
    onTap: _onNavBarItemTapped,
    currentIndex: _selectedTabIndex,
    items: [
      BottomNavigationBarItem(
        label: favouritesLabel,
        icon: EldelSvgIcon(
          svgImgPath: 'assets/icons/heart.svg',
          semanticsLabel: favouritesLabel,
          color: _selectedTabIndex == favouritesTabIndex
              ? iconColorPrimary
              : iconColorSecondary,
        ),
      ),
      BottomNavigationBarItem(
        label: chargePointsLabel,
        icon: EldelSvgIcon(
          svgImgPath: 'assets/icons/eldel_logo.svg',
          semanticsLabel: favouritesLabel,
          color: _selectedTabIndex == chargePointsTabIndex
              ? iconColorPrimary
              : iconColorSecondary,
        ),
      ),
      BottomNavigationBarItem(
        label: messagesLabel,
        icon: EldelSvgIcon(
          svgImgPath: 'assets/icons/messages.svg',
          semanticsLabel: messagesLabel,
          color: _selectedTabIndex == messagesTabIndex
              ? iconColorPrimary
              : iconColorSecondary,
        ),
      ),
      BottomNavigationBarItem(
          label: myAccountLabel,
          icon: EldelSvgIcon(
            svgImgPath: 'assets/icons/my_account.svg',
            semanticsLabel: myAccountLabel,
            color: _selectedTabIndex == myAccountTabIndex
                ? iconColorPrimary
                : iconColorSecondary,
          )),
    ],
  );
}
