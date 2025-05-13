import 'package:edu_teens/theme/extensions/text_button_variant_themes.dart';
import 'package:flutter/material.dart';

enum AppTextButtonType { text, link }

class AppTextButton extends StatelessWidget {
  final String title;
  final AppTextButtonType type;
  final VoidCallback? onPress;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;

  const AppTextButton({
    required this.title,
    required this.type,
    this.onPress,
    this.onHover,
    this.onLongPress,
    super.key,
  });

  ButtonStyle _selectStyle(TextButtonVariantThemes theme) {
    switch (type) {
      case AppTextButtonType.text:
        return theme.text;
      case AppTextButtonType.link:
        return theme.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<TextButtonVariantThemes>()!;

    return TextButton(
      onPressed: onPress,
      onHover: onHover,
      onLongPress: onLongPress,
      style: _selectStyle(theme),
      child: Text(title),
    );
  }
}
