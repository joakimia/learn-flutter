import 'package:app/styles/borders.dart';
import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/shared/widgets/card.dart';

class EldelCardButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback _onTap;
  final Color _cardColor;

  const EldelCardButton({Key? key, required VoidCallback onTap, required Widget child, Color? cardColor})
      : _onTap = onTap,
        _child = child,
        _cardColor = cardColor ?? backgroundColorPrimary,
        super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: _onTap,
    child: EldelCard(
      cardColor: _cardColor,
      cardBorderRadius: borderRadiusXSmall,
      child: Padding(
        child: _child,
        padding: const EdgeInsets.only(
            top: spaceXSmall,
            right: spaceSmall,
            bottom: spaceXSmall,
            left: spaceSmall
        ),
      ),
    ),
  );
}
