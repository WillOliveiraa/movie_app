import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../spacings/sizes.dart';

class CircleProgress extends StatelessWidget {
  final String vote;

  const CircleProgress({Key? key, required this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.width(context) / 10,
      height: Sizes.width(context) / 10,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: Sizes.width(context) / 10,
              height: Sizes.width(context) / 10,
              decoration: BoxDecoration(
                color: AppColors.blueGrey,
                borderRadius: BorderRadius.circular(
                  Sizes.dp20(context),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: Sizes.dp30(context),
              height: Sizes.dp30(context),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.getColorCircleProgress(
                    double.parse(vote),
                  ),
                ),
                backgroundColor: AppColors.grey,
                value: double.parse(vote) / 10.0,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: Sizes.dp30(context),
              height: Sizes.dp30(context),
              child: Center(
                child: Text(
                  '${(double.parse(vote) * 10.0).floor().toString()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.dp10(context),
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
