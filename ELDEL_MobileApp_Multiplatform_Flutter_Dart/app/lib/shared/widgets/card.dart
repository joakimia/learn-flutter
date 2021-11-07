import 'package:app/styles/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/styles/colors.dart';

class EldelCard extends StatelessWidget {
  final Widget _child;
  final Color _cardColor;
  final double _cardBorderRadius;

  const EldelCard(
      {Key? key,
      required Widget child,
      Color? cardColor,
      double? cardBorderRadius})
      : _child = child,
        _cardColor = cardColor ?? backgroundColorPrimary,
        _cardBorderRadius =  cardBorderRadius ?? borderRadiusLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    color: eldelColorTransparent,
    child: Card(
      child: Center(child: _child),
      color: _cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cardBorderRadius),
      ),
    ),
  );
}
