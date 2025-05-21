import 'package:edu_teens/theme/extensions/icon_button_variant_themes.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:flutter/material.dart';

enum NextButtonType { primary, neutral, outlined, secondary, text }

class NextButton extends StatelessWidget {
  final NextButtonType type;
  final VoidCallback? onPress;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;

  const NextButton({
    required this.type,
    this.onPress,
    this.onHover,
    this.onLongPress,
    super.key,
  });

  ButtonStyle _selectStyle(IconButtonVariantThemes theme) {
    switch (type) {
      case NextButtonType.primary:
        return theme.primary;
      case NextButtonType.neutral:
        return theme.neutral;
      case NextButtonType.outlined:
        return theme.outlined;
      case NextButtonType.secondary:
        return theme.secondary;
      case NextButtonType.text:
        return theme.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<IconButtonVariantThemes>()!;

    return IconButton(
      icon: Icon(AppIcons.right),
      onPressed: onPress,
      onHover:onHover,
      onLongPress: onLongPress,
      style: _selectStyle(theme),
    );
  }
}
