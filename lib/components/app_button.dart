import 'package:edu_teens/theme/extensions/elevated_button_variant_themes.dart';
import 'package:flutter/material.dart';

enum AppButtonType { primary, neutral, outlined, secondary }

class AppButton extends StatelessWidget {
  final String title;
  final AppButtonType type;
  final VoidCallback? onPress;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;

  const AppButton({
    required this.title,
    required this.type,
    this.onPress,
    this.onHover,
    this.onLongPress,
    super.key,
  });

  ButtonStyle _selectStyle(ElevatedButtonVariantThemes theme) {
    switch (type) {
      case AppButtonType.primary:
        return theme.primary;
      case AppButtonType.neutral:
        return theme.neutral;
      case AppButtonType.outlined:
        return theme.outlined;
      case AppButtonType.secondary:
        return theme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ElevatedButtonVariantThemes>()!;

    return ElevatedButton(
      onPressed: onPress,
      onHover: onHover,
      onLongPress: onLongPress,
      style: _selectStyle(theme),
      child: Text(title),
    );
  }
}
