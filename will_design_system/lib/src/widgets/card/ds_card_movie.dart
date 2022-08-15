import 'dart:ui';

import 'package:flutter/material.dart';

import '../../styles/color_palettes.dart';
import '../text/ds_text.dart';

class DSCardMovie extends StatelessWidget {
  final String url;
  final String? title;
  final String? subtitle;
  final String? description;
  final double? width;
  final double? height;
  final bool showPlayButton;
  final Function()? onTap;

  const DSCardMovie(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.title,
    this.subtitle,
    this.description,
    this.showPlayButton = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height ?? 170,
        width: width ?? 170,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.grey.shade800,
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Stack(
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: double.maxFinite,
                  height: 60,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DSText(
                              title ?? '',
                              style: textTheme.titleSmall,
                              margin: const EdgeInsets.only(
                                left: 4,
                                bottom: 5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: ColorPalettes.yellow,
                                ),
                                DSText(
                                  subtitle ?? '',
                                  style: textTheme.bodySmall,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    left: 3,
                                  ),
                                ),
                                DSText(
                                  description ?? '',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: showPlayButton,
                child: Positioned(
                  bottom: 45,
                  right: 20,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorPalettes.white,
                    ),
                    child: Icon(
                      Icons.play_circle,
                      color: ColorPalettes.lightPrimary,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
