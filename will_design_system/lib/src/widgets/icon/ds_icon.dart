import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import '../../assets/asset_svg.dart';
import '../../constants/constants.dart';

export '../../assets/asset_svg.dart';

class DSIcon extends StatelessWidget {
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

  const DSIcon(
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (svg == AssetSvg.none) {
      return const SizedBox();
    }

    return Padding(
      padding: margin ?? const EdgeInsets.all(0),
      child: SvgPicture.asset(
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
    );
  }
}
