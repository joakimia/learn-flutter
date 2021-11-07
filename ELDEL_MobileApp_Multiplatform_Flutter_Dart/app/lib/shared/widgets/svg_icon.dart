import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/styles/icons.dart';
import 'package:app/styles/colors.dart';

class EldelSvgIcon extends StatelessWidget {
  final String _svgImgPath;
  final String _semanticsLabel;
  final Color? _color;
  final double _width;
  final double _height;
  final bool _cacheColorFilter;

  const EldelSvgIcon(
      {Key? key,
      required String svgImgPath,
      required String semanticsLabel,
      Color? color,
      double? height,
      double? width,
      bool? cacheColorFilter})
      : _svgImgPath = svgImgPath,
        _semanticsLabel = semanticsLabel,
        _color = color ?? iconColorSecondary,
        _width = width ?? iconWidthLarge,
        _height = height ?? iconHeightLarge,
        _cacheColorFilter = cacheColorFilter ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
      _svgImgPath,
      semanticsLabel: _semanticsLabel,
      color: _color,
      height: _height,
      width: _width,
      cacheColorFilter: _cacheColorFilter,
      placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
    );
}
