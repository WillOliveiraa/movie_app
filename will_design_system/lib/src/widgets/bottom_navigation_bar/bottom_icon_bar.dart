import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';

class BottomIconBar extends StatelessWidget {
  final String title;
  final AssetSvg icon;
  final Function()? onTap;
  final bool isSelectedPage;

  const BottomIconBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelectedPage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSIcon(
            icon,
            color: isSelectedPage ? AppColors.lightPrimary : AppColors.white,
          ),
          DSText(
            title,
            style: textTheme.labelMedium?.copyWith(
              color: isSelectedPage ? AppColors.lightPrimary : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
