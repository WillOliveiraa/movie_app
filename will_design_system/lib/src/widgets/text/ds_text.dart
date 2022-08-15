import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

class DSText extends StatelessWidget {
  final String data;
  final String? fallback;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Map<String, dynamic>? params;

  const DSText(
    this.data, {
    super.key,
    this.params,
    this.style,
    this.fallback,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final text = fallback ?? data;
    final colorTheme = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Semantics(
          label: semanticsLabel,
          child: StyledText(
            text: _scapedCharacters(text),
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            tags: {
              'b': StyledTextTag(
                style: style?.copyWith(fontWeight: FontWeight.bold) ??
                    const TextStyle(fontWeight: FontWeight.bold),
              ),
              'i': StyledTextTag(
                style: style?.copyWith(fontStyle: FontStyle.italic) ??
                    const TextStyle(fontStyle: FontStyle.italic),
              ),
              'u': StyledTextTag(
                style: style?.copyWith(decoration: TextDecoration.underline) ??
                    const TextStyle(decoration: TextDecoration.underline),
              ),
              'primary': StyledTextTag(
                style: style?.copyWith(color: colorTheme.primary) ??
                    TextStyle(color: colorTheme.primary),
              ),
              'secondary': StyledTextTag(
                style: style?.copyWith(color: colorTheme.secondary) ??
                    TextStyle(color: colorTheme.secondary),
              ),
            },
          ),
        ),
      ),
    );
  }

  String _scapedCharacters(String text) {
    return text.replaceAll("'", '&apos;');
  }
}
