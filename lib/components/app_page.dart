import 'package:edu_teens/theme/extensions/app_page_theme.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';

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

class AppPage extends StatelessWidget {
  final List<Widget> children;
  final bool topRounded;
  final bool gridView;
  final bool scroll;
  final ScrollController? scrollController;
  final String? pageStorageKey;
  const AppPage({
    super.key,
    required this.children,
    this.topRounded = true,
    this.scroll = true,
    this.gridView = false,
    this.scrollController,
    this.pageStorageKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppPageTheme>()!;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(theme.style.verticalPadding),
        topRight: Radius.circular(theme.style.verticalPadding),
      ),
      child: Container(
        decoration: BoxDecoration(color: theme.style.backgroundColor),
        child:
            scroll
                ? PageCustomScrollView(
                  scrollController: scrollController,
                  pageStorageKey: pageStorageKey,
                  gridView: gridView,
                  theme: theme,
                  children: children,
                )
                : Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.style.verticalPadding,
                    horizontal: theme.style.horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(width: double.infinity),
                      ..._withVerticalGaps(children, theme.style.verticalGap),
                    ],
                  ),
                ),
      ),
    );
  }
}

class PageCustomScrollView extends StatelessWidget {
  final ScrollController? scrollController;
  final bool gridView;
  final List<Widget> children;
  final AppPageTheme theme;
  final String? pageStorageKey;
  const PageCustomScrollView({
    super.key,
    required this.gridView,
    required this.children,
    required this.theme,
    this.scrollController,
    this.pageStorageKey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      key:
          pageStorageKey != null
              ? PageStorageKey<String>(pageStorageKey!)
              : null,
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: theme.style.verticalPadding,
            horizontal: theme.style.horizontalPadding,
          ),
          sliver:
              gridView
                  ? SliverGrid(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                          crossAxisCount: 2,
                          mainAxisSpacing: theme.style.verticalGap,
                          crossAxisSpacing: theme.style.verticalGap,
                          childAspectRatio: 5 / 4.5,
                          itemCount: children.length,
                        ),
                    delegate: SliverChildListDelegate(children),
                  )
                  : SliverList.list(
                    children: _withVerticalGaps(
                      children,
                      theme.style.verticalGap,
                    ),
                  ),
        ),
      ],
    );
  }
}
