import 'dart:ui';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../../spacings/spacing.dart';
import '../../styles/app_colors.dart';
import '../icon/icon.dart';
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
        height: height ?? 170.h,
        width: width ?? 170.w,
        margin: EdgeInsets.only(bottom: 10.h),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.grey.shade800,
              blurRadius: Spacing.x1.r,
            ),
          ],
        ),
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
                height: Spacing.x15.h,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DSText(
                            title ?? '',
                            style: textTheme.titleSmall,
                            margin: EdgeInsets.only(
                              left: Spacing.x1.w,
                              bottom: 5.h,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              DSIcon(
                                AssetSvg.star,
                                color: AppColors.yellow,
                                width: Spacing.x5.w,
                              ),
                              DSText(
                                subtitle ?? '',
                                style: textTheme.bodySmall,
                                margin: EdgeInsets.only(
                                  right: 10.w,
                                  left: 3.w,
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
                bottom: 45.h,
                right: Spacing.x5.w,
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Spacing.x2.r),
                    color: AppColors.white,
                  ),
                  child: Icon(
                    Icons.play_circle,
                    color: AppColors.lightPrimary,
                    size: Spacing.x5.w,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
