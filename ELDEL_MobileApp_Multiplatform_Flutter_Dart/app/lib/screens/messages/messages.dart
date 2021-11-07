import 'package:flutter/material.dart';

import 'package:app/core/top_app_bar.dart';
import 'package:app/shared/constants/label.dart';
import 'package:app/shared/widgets/svg_icon.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/font.dart';
import 'package:app/styles/spacings.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: EldelTopAppBar.getAppBarByLabel(messagesLabel),
    body: Container(
      color: backgroundColorPrimary,
      padding: const EdgeInsets.only(
          top: spaceXXXLarge, left: spaceSmall, right: spaceSmall),
      width: double.infinity,
      child: Container(
        color: backgroundColorPrimary,
        padding: const EdgeInsets.only(
            top: spaceXXXLarge, left: spaceSmall, right: spaceSmall),
        width: double.infinity,
        child: Column(
          children: const [
            Text(
              noMessagesLabel,
              style: TextStyle(
                  fontSize: fontSizeLarge, color: textColor),
            ),
            SizedBox(height: 150),
            EldelSvgIcon(
              svgImgPath: 'assets/icons/messages.svg',
              semanticsLabel: messagesLabel,
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    )
  );
}
