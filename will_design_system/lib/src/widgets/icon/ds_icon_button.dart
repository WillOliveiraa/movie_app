import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import '../../assets/asset_svg.dart';
import '../../constants/constants.dart';

class DSIconButton extends StatelessWidget {
  final AssetSvg svg;
  final Color? color;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final String? semanticsLabel;
  final Clip clipBehavior;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  const DSIconButton(
    this.svg, {
    Key? key,
    this.color,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.margin,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        visualDensity: VisualDensity.compact,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: SvgPicture.asset(
          svg.value,
          package: PACKAGE_NAME,
          color: color,
          excludeFromSemantics: excludeFromSemantics,
          width: width,
          height: height,
          semanticsLabel: semanticsLabel,
          clipBehavior: clipBehavior,
          alignment: alignment,
          fit: fit,
        ),
      ),
    );
  }
}
