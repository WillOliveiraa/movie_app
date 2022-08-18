import 'dart:ui';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../../assets/asset_svg.dart';
import '../../spacings/spacing.dart';
import 'bottom_icon_bar.dart';

class DSBottomNavigationBar extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final Function(int)? onPageChanged;

  const DSBottomNavigationBar(
    this.pageController, {
    super.key,
    required this.currentPage,
    this.onPageChanged,
  });

  @override
  State<DSBottomNavigationBar> createState() => _DSBottomNavigationBarState();
}

class _DSBottomNavigationBarState extends State<DSBottomNavigationBar> {
  PageController get controller => widget.pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Spacing.x1.h,
      right: Spacing.x5.w,
      left: Spacing.x5.w,
      child: Container(
        height: 90.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomIconBar(
                  title: 'Home',
                  icon: AssetSvg.home,
                  isSelectedPage: widget.currentPage == 0,
                  onTap: () => setState(() => widget.onPageChanged?.call(0)),
                ),
                BottomIconBar(
                  title: 'Live TV',
                  icon: AssetSvg.monitor,
                  isSelectedPage: widget.currentPage == 1,
                  onTap: () => setState(() => widget.onPageChanged?.call(1)),
                ),
                BottomIconBar(
                  title: 'Movies',
                  icon: AssetSvg.playCircle,
                  isSelectedPage: widget.currentPage == 2,
                  onTap: () => setState(() => widget.onPageChanged?.call(2)),
                ),
                BottomIconBar(
                  title: 'Settings',
                  icon: AssetSvg.settings,
                  isSelectedPage: widget.currentPage == 3,
                  onTap: () => setState(() => widget.onPageChanged?.call(3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
