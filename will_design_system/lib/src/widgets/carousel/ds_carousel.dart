import 'dart:async';
import 'dart:ui';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../../../will_design_system.dart';

class DSCarousel extends StatefulWidget {
  final List<String> data;
  final Widget Function(BuildContext, int) itemBuilder;
  final Function(int)? onPageChanged;
  final bool? pageSnapping;
  final double? height;
  final bool? enableInfiniteScroll;
  final bool autoPlay;
  final Duration? autoPlayInterval;
  final Duration? autoPlayAnimationDuration;
  final Curve? autoPlayCurve;
  final Function()? onClosed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool showDots;

  const DSCarousel({
    super.key,
    this.data = const [],
    required this.itemBuilder,
    this.onPageChanged,
    this.pageSnapping,
    this.height,
    this.autoPlay = true,
    this.autoPlayInterval,
    this.autoPlayAnimationDuration,
    this.autoPlayCurve,
    this.enableInfiniteScroll = true,
    this.onClosed,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.showDots = false,
  });

  @override
  State<DSCarousel> createState() => _DSCarouselState();
}

class _DSCarouselState extends State<DSCarousel> {
  late PageController controller;
  late Timer? timer;
  int currentPage = 0;
  int get itemCount => widget.data.length;

  @override
  void initState() {
    super.initState();
    _initTimer();

    controller = PageController();
  }

  void _initTimer() {
    if (itemCount == 0 || !widget.autoPlay) return;

    timer = Timer.periodic(
      widget.autoPlayInterval ?? const Duration(seconds: 3),
      (timer) {
        _changePage();
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (itemCount == 0) return const SizedBox();

    return Container(
      height: widget.height ?? 300.h,
      width: double.infinity,
      margin: widget.margin,
      padding: widget.padding,
      color: widget.backgroundColor,
      child: GestureDetector(
        onTapDown: (details) => timer?.cancel(),
        onTapUp: (details) => _initTimer(),
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: widget.enableInfiniteScroll! ? null : itemCount,
              pageSnapping: widget.pageSnapping ?? true,
              onPageChanged: (page) {
                setState(() => currentPage = page % itemCount);
                widget.onPageChanged?.call(page);
              },
              itemBuilder: (context, idx) {
                final realIndex = idx % itemCount;

                return widget.itemBuilder(context, realIndex);
              },
            ),
            Positioned(
              top: Spacing.x5.h,
              right: Spacing.x5.w,
              child: SizedBox(
                width: 50.w,
                height: 25.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Center(
                      child: DSText(
                        '${currentPage + 1}/$itemCount',
                        style: textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            showDots(context)
          ],
        ),
      ),
    );
  }

  Widget showDots(BuildContext context) {
    return Visibility(
      visible: widget.showDots,
      child: Positioned(
        bottom: Spacing.x5.h,
        right: Spacing.zero,
        left: Spacing.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            itemCount,
            (index) => AnimatedContainer(
              margin: index < itemCount ? EdgeInsets.only(right: 5.w) : null,
              duration: const Duration(milliseconds: 300),
              height: 6.h,
              width: currentPage == index ? Spacing.x5.w : 6.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: currentPage == index
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.grey20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changePage() {
    currentPage = (currentPage + 1) < widget.data.length ? currentPage + 1 : 0;

    controller.animateToPage(
      currentPage,
      duration: widget.autoPlayAnimationDuration ?? const Duration(seconds: 1),
      curve: widget.autoPlayCurve ?? Curves.fastOutSlowIn,
    );
  }
}
