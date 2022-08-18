import 'package:core_module/core_module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';

class DSTabBar extends StatefulWidget {
  final List<String> tabItems;
  final int? initialTab;
  final Function(int)? onTabChanged;
  final double? height;
  final String? semanticLabel;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final Color? selectedColor;
  final Color? labelColor;
  final Color? selectedLabelColor;

  const DSTabBar({
    super.key,
    required this.tabItems,
    this.initialTab,
    this.onTabChanged,
    this.height,
    this.semanticLabel,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.selectedColor,
    this.labelColor,
    this.selectedLabelColor,
  });

  @override
  State<DSTabBar> createState() => _DSTabBarState();
}

class _DSTabBarState extends State<DSTabBar> {
  late ItemScrollController itemScrollController;
  late ItemPositionsListener itemPositionsListener;
  late ValueNotifier<int> tabNotifier;

  @override
  void initState() {
    super.initState();
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
    tabNotifier = ValueNotifier(widget.initialTab ?? 0);
  }

  @override
  void dispose() {
    tabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      child: Container(
        margin: EdgeInsets.only(
          bottom: widget.paddingBottom ?? Spacing.x2.h,
          top: widget.paddingTop ?? Spacing.x2.h,
        ),
        width: MediaQuery.of(context).size.width,
        height: widget.height ?? Spacing.x5.h,
        child: ScrollablePositionedList.builder(
          padding: EdgeInsets.only(
            left: widget.paddingLeft ?? Spacing.x2.w,
            right: widget.paddingRight ?? Spacing.x2.w,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: widget.tabItems.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemBuilder: (context, index) {
            final tab = widget.tabItems.elementAt(index);

            return ValueListenableBuilder(
              valueListenable: tabNotifier,
              builder: (context, value, child) {
                return _DSTabItem(
                  onTap: () {
                    final alignment = tabNotifier.value >= index ? 0.2 : 0.0;
                    tabNotifier.value = index;

                    itemScrollController.scrollTo(
                      index: index,
                      alignment: alignment,
                      duration: const Duration(milliseconds: 600),
                    );

                    widget.onTabChanged?.call(index);
                  },
                  label: tab,
                  height: widget.height ?? Spacing.x5.h,
                  isSelected: tabNotifier.value == index,
                  selectedColor: widget.selectedColor,
                  labelColor: widget.labelColor,
                  selectedLabelColor: widget.selectedLabelColor,
                  margin: index < (widget.tabItems.length - 1)
                      ? EdgeInsets.only(right: Spacing.x1.w)
                      : null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _DSTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? labelColor;
  final Color? selectedLabelColor;
  final EdgeInsetsGeometry? margin;
  final double height;

  const _DSTabItem({
    required this.label,
    required this.isSelected,
    required this.height,
    this.onTap,
    this.selectedColor,
    this.labelColor,
    this.selectedLabelColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Semantics(
      label: label,
      container: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.x1.r),
          color: isSelected
              ? selectedColor ?? AppColors.black
              : AppColors.transparent,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(Spacing.x1.r),
            onTap: () => onTap?.call(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Spacing.x1.w,
                vertical: Spacing.x1.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DSText(
                    label,
                    style: isSelected
                        ? textStyle.titleSmall?.copyWith(
                            color: selectedLabelColor ?? AppColors.white,
                          )
                        : textStyle.bodySmall
                            ?.copyWith(color: labelColor ?? AppColors.grey20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
