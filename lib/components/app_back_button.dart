import 'package:edu_teens/theme/extensions/icon_button_variant_themes.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:flutter/material.dart';

enum AppBackButtonType { primary, neutral, outlined, secondary, text }

class AppBackButton extends StatelessWidget {
  final AppBackButtonType type;
  final VoidCallback? onPress;

  const AppBackButton({
    required this.type,
    this.onPress,
    super.key,
  });

  ButtonStyle _selectStyle(IconButtonVariantThemes theme) {
    switch (type) {
      case AppBackButtonType.primary:
        return theme.primary;
      case AppBackButtonType.neutral:
        return theme.neutral;
      case AppBackButtonType.outlined:
        return theme.outlined;
      case AppBackButtonType.secondary:
        return theme.secondary;
      case AppBackButtonType.text:
        return theme.text;
    }
  }

  void _onPress(BuildContext context) {
    if (onPress != null) {
      onPress!();
    } 
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<IconButtonVariantThemes>()!;

    return IconButton(
      icon: Icon(AppIcons.left),
      onPressed: () => _onPress(context),
      style: _selectStyle(theme),
    );
  }
}
