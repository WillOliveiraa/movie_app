import 'package:flutter/material.dart';

class DSCard extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? padding, margin;
  final double? width, height;
  final VoidCallback? onTap;
  final Widget? child;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? radius;

  const DSCard({
    super.key,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.border,
    this.boxShadow,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        margin: margin ?? const EdgeInsets.all(0),
        padding: padding ?? const EdgeInsets.fromLTRB(10, 18, 10, 18),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).backgroundColor,
          borderRadius: radius ?? BorderRadius.circular(26),
          border: border,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  offset: const Offset(0, 8),
                  color: Colors.grey.shade600,
                  blurRadius: 5,
                ),
              ],
        ),
        child: child,
      ),
    );
  }
}
