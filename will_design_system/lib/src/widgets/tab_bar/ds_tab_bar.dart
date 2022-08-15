import 'package:flutter/material.dart';

import '../../../will_design_system.dart';

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
  int _activePageIndex = 0;

  @override
  void initState() {
    super.initState();
    _activePageIndex = widget.initialTab ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      child: Container(
        margin: EdgeInsets.only(
          bottom: widget.paddingBottom ?? Sizes.dp5(context),
          top: widget.paddingTop ?? Sizes.dp5(context),
        ),
        width: MediaQuery.of(context).size.width,
        height: widget.height ?? Sizes.dp10(context),
        child: ListView(
          padding: EdgeInsets.only(
            left: widget.paddingLeft ?? Sizes.dp5(context),
            right: widget.paddingRight ?? Sizes.dp5(context),
          ),
          scrollDirection: Axis.horizontal,
          children: widget.tabItems.map(
            (tab) {
              final index = widget.tabItems.indexOf(tab);

              return _DSTabItem(
                onTap: () {
                  widget.onTabChanged?.call(index);
                  setState(() => _activePageIndex = index);
                },
                label: tab,
                isSelected: _activePageIndex == index,
                selectedColor: widget.selectedColor,
                labelColor: widget.labelColor,
                selectedLabelColor: widget.selectedLabelColor,
              );
            },
          ).toList(),
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

  const _DSTabItem({
    required this.label,
    required this.isSelected,
    this.onTap,
    this.selectedColor,
    this.labelColor,
    this.selectedLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Semantics(
      label: label,
      container: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: Sizes.dp8(context),
        margin: EdgeInsets.symmetric(horizontal: Sizes.dp10(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dp8(context)),
          color: isSelected
              ? selectedColor ?? ColorPalettes.lightPrimary
              : ColorPalettes.transparent,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(Sizes.dp8(context)),
            onTap: () => onTap?.call(),
            child: Padding(
              padding: EdgeInsets.all(Sizes.dp12(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: isSelected
                        ? textStyle.titleSmall?.copyWith(
                            color: selectedLabelColor ?? ColorPalettes.white,
                          )
                        : textStyle.bodySmall?.copyWith(
                            color: labelColor ?? ColorPalettes.grey20),
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
