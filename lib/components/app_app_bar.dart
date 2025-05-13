import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/providers/scroll_controller_provider.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppAppBar extends StatefulWidget {
  const AppAppBar({super.key});

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider = Provider.of<ScrollControllerProvider>(
      context,
    );
    final theme = Theme.of(context).extension<AppAppBarTheme>()!;

    double height = interpolate(
      maxBound: theme.style.flexibleSpaceExpandedHeight,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );

    double opacity = interpolate(
      maxBound: 1,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );

    return Container(
      color: theme.style.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: theme.style.horizontalPadding,
        vertical: theme.style.verticalPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(backgroundColor: Colors.white, radius: 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLabel(
                    label: "12500 puntos",
                    type: AppLabelType.primary,
                    icon: AppIcons.money,
                    filled: false,
                  ),
                ],
              ),
            ],
          ),
          Opacity(
            opacity: opacity,
            child: SizedBox(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("¡Bienvenida, Luciana! "),
                  SizedBox(
                    height: theme.style.verticalFlexibleSpaceGap,
                    width: double.infinity,
                  ),
                  Text("¿Lista para romperla con las mates hoy?"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
