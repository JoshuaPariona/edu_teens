import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppProgressSlider extends StatelessWidget {
  final Color foregroundColor;
  final Color backgroundColor;
  final double height;
  final double progress;
  const AppProgressSlider({
    super.key,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.progress,
    this.height = AppDimensions.spaceSmall,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final progressWidth = totalWidth * progress;
        return Stack(
          children: [
            Container(
              width: totalWidth,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(height/2),
              ),
            ),
            Container(
              width: progressWidth,
              height: height,
              decoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(height/2),
              ),
            ),
          ],
        );
      },
    );
  }
}
