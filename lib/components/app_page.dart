import 'package:edu_teens/providers/scroll_controller_provider.dart';
import 'package:edu_teens/theme/extensions/app_page_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPage extends StatelessWidget {
  final List<Widget> children;
  final bool attachScrollController;
  final bool topRounded;
  const AppPage({
    super.key,
    required this.children,
    this.attachScrollController = false,
    this.topRounded = true,
  });

  List<Widget> _withVerticalGaps(List<Widget> originalSlivers, double gap) {
    final List<Widget> spaced = [];

    for (int i = 0; i < originalSlivers.length; i++) {
      spaced.add(originalSlivers[i]);
      if (i < originalSlivers.length - 1) {
        spaced.add(SizedBox(height: gap));
      }
    }

    return spaced;
  }

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider = Provider.of<ScrollControllerProvider>(
      context,
    );
    final theme = Theme.of(context).extension<AppPageTheme>()!;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(theme.style.verticalPadding),
        topRight: Radius.circular(theme.style.verticalPadding),
      ),
      child: Container(
        decoration: BoxDecoration(color: theme.style.backgroundColor),
        child: CustomScrollView(
          controller:
              attachScrollController
                  ? scrollControllerProvider.scrollController
                  : null,
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: theme.style.verticalPadding,
                horizontal: theme.style.horizontalPadding,
              ),
              sliver: SliverList.list(
                children: _withVerticalGaps(children, theme.style.verticalGap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
