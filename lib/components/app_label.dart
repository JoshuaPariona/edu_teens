import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/theme/extensions/app_label_variant_themes.dart';
import 'package:flutter/material.dart';

enum AppLabelType {
  neutral,
  disabled,
  primary,
  secondary,
  tertiary,
  success,
  error,
  warning,
}

class AppLabel extends StatelessWidget {
  final AppLabelType type;
  final IconData icon;
  final String label;
  final bool filled;
  final bool cancellable;
  final VoidCallback? onCancel;
  const AppLabel({
    super.key,
    required this.label,
    required this.type,
    required this.icon,
    this.cancellable = false,
    this.filled = false,
    this.onCancel,
  });

  LabelStyle _selectStyle(AppLabelVariantThemes themes) {
    switch (type) {
      case AppLabelType.neutral:
        return themes.neutral;
      case AppLabelType.disabled:
        return themes.disabled;
      case AppLabelType.primary:
        return themes.primary;
      case AppLabelType.secondary:
        return themes.secondary;
      case AppLabelType.tertiary:
        return themes.tertiary;
      case AppLabelType.success:
        return themes.success;
      case AppLabelType.error:
        return themes.error;
      case AppLabelType.warning:
        return themes.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).extension<AppLabelVariantThemes>()!;
    final LabelStyle style = _selectStyle(themes);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: style.verticalPadding,
        horizontal: style.horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: filled ? style.filledBackgroundColor : style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: style.leadingIconSize,
            color: filled ? style.filledForegroundColor : style.foregroundColor,
          ),
          SizedBox(width: style.horizontalGap),
          AppText(
            text: label,
            size: AppTextSizeType.description,
            weight: AppTextWeightType.medium,
            color: filled ? style.filledForegroundColor : style.foregroundColor,
          ),
          if (cancellable)
            ...[
              SizedBox(width: style.horizontalGap),
              Icon(
              AppIcons.close,
              size: style.cancelIconSize,
              color:
                  filled ? style.filledCancelIconColor : style.cancelIconColor,
            )],
        ],
      ),
    );
  }
}
