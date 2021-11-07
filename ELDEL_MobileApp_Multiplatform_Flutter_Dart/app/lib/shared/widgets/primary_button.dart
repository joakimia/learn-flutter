import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:app/styles/borders.dart';
import 'package:app/styles/spacings.dart';
import 'package:app/styles/colors.dart';

class EldelPrimaryButton extends StatelessWidget {
  final Widget _child;
  final double _borderRadius;
  final EdgeInsets _padding;
  final VoidCallback _onTap;

  const EldelPrimaryButton(
      {Key? key,
      required Widget child,
      required VoidCallback onTap,
      double? borderRadius,
      EdgeInsets? padding })
      : _child = child,
        _onTap = onTap,
        _borderRadius = borderRadius ?? borderRadiusMedium,
        _padding = padding ?? const EdgeInsets.all(spaceSmall),
        super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: _child,
        onPressed: _onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(_padding),
          foregroundColor: MaterialStateProperty.all(eldelColorBlack),
          backgroundColor: MaterialStateProperty.all(buttonColorPrimary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
          ),
        ),
      );
}
