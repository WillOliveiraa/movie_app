import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../../spacings/spacing.dart';
import '../../styles/app_colors.dart';

class GenreChip extends StatelessWidget {
  final int id;
  const GenreChip({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(
          horizontal: Spacing.x2.w, vertical: Spacing.x2.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(Spacing.x5.r),
      ),
      child: Text(
        Genres.genres[id] ?? 'No Gender',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
