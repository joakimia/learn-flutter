import 'package:flutter/material.dart';

import 'package:app/shared/constants/label.dart';
import 'package:app/shared/widgets/card_button.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/icons.dart';

class MyChargersButton extends StatelessWidget {
  final VoidCallback _onTap;

  const MyChargersButton({Key? key, required VoidCallback onTap})
      : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) => EldelCardButton(
    onTap: _onTap,
    cardColor: backgroundColorSecondary,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            EldelSvgIcon(
              svgImgPath: 'assets/icons/lightning_bolt.svg',
              semanticsLabel: myChargersLabel,
              color: eldelColorWhite,
            ),
            Text(myChargersLabel,
                style: TextStyle(color: textColor)),
            EldelSvgIcon(
              svgImgPath: 'assets/icons/arrow_right.svg',
              semanticsLabel: myChargersLabel,
              color: eldelColorWhite,
              width: iconWidthXSmall,
              height: iconHeightXSmall,
            ),
          ],
        ),
      ],
    ),
  );
}
