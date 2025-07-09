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
  final Widget? header;
  final bool topRounded;
  final bool gridView;
  final bool scroll;
  final ScrollController? scrollController;
  final String? pageStorageKey;
  final bool topPaddingFixed;
  final double childAspectRatio;
  final bool withPadding;
  const AppPage({
    super.key,
    required this.children,
    this.header,
    this.childAspectRatio = 5 / 4.5,
    this.topRounded = true,
    this.scroll = true,
    this.gridView = false,
    this.topPaddingFixed = true,
    this.scrollController,
    this.pageStorageKey,
    this.withPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppPageTheme>()!;

    return scroll
        ? _PageCustomScrollView(
          scrollController: scrollController,
          pageStorageKey: pageStorageKey,
          topRounded: topRounded,
          gridView: gridView,
          theme: theme,
          header: header,
          topPaddingFixed: topPaddingFixed,
          childAspectRatio: childAspectRatio,
          withPadding: withPadding,
          children: children,
        )
        : _PageView(
          theme: theme,
          header: header,
          topRounded: topRounded,
          withPadding: withPadding,
          children: children,
        );
  }
}

class _PageView extends StatelessWidget {
  final Widget? header;
  final List<Widget> children;
  final AppPageTheme theme;
  final bool topRounded;
  final bool withPadding;
  const _PageView({
    required this.children,
    required this.topRounded,
    required this.withPadding,
    required this.theme,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(width: double.infinity),
        header != null ? header! : SizedBox(),
        Expanded(
          child: Container(
            padding:
                withPadding
                    ? EdgeInsets.symmetric(
                      vertical: theme.style.verticalPadding,
                      horizontal: theme.style.horizontalPadding,
                    )
                    : null,
            decoration: BoxDecoration(
              color: theme.style.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft:
                    topRounded
                        ? Radius.circular(theme.style.verticalPadding)
                        : Radius.zero,
                topRight:
                    topRounded
                        ? Radius.circular(theme.style.verticalPadding)
                        : Radius.zero,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: double.infinity),
                ..._withVerticalGaps(children, theme.style.verticalGap),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PageCustomScrollView extends StatelessWidget {
  final ScrollController? scrollController;
  final bool topRounded;
  final Widget? header;
  final bool gridView;
  final List<Widget> children;
  final AppPageTheme theme;
  final String? pageStorageKey;
  final bool topPaddingFixed;
  final double childAspectRatio;
  final bool withPadding;
  const _PageCustomScrollView({
    required this.gridView,
    required this.children,
    required this.theme,
    required this.topRounded,
    required this.topPaddingFixed,
    required this.childAspectRatio,
    required this.withPadding,
    this.header,
    this.scrollController,
    this.pageStorageKey,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: theme.style.backgroundColor,
      child: CustomScrollView(
        controller: scrollController,
        key:
            pageStorageKey != null
                ? PageStorageKey<String>(pageStorageKey!)
                : null,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: header),
          if (topPaddingFixed && withPadding)
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyHeaderDelegate(
                child: Container(
                  color: theme.style.appBackgroundColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.style.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            topRounded
                                ? Radius.circular(theme.style.verticalPadding)
                                : Radius.zero,
                        topRight:
                            topRounded
                                ? Radius.circular(theme.style.verticalPadding)
                                : Radius.zero,
                      ),
                    ),
                  ),
                ),
                minHeight: theme.style.verticalPadding,
                maxHeight: theme.style.verticalPadding,
              ),
            ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding:
                  withPadding
                      ? EdgeInsets.only(
                        top: topPaddingFixed ? 0 : theme.style.verticalPadding,
                        bottom: theme.style.verticalPadding,
                        left: theme.style.horizontalPadding,
                        right: theme.style.horizontalPadding,
                      )
                      : null,
              color: theme.style.backgroundColor,
              child:
                  gridView
                      ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: children.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
                              crossAxisCount: 2,
                              mainAxisSpacing: theme.style.verticalGap,
                              crossAxisSpacing: theme.style.verticalGap,
                              childAspectRatio: childAspectRatio,
                              itemCount: children.length,
                            ),
                        itemBuilder: (context, index) => children[index],
                      )
                      : Column(
                        children: _withVerticalGaps(
                          children,
                          theme.style.verticalGap,
                        ),
                      ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(color: theme.style.backgroundColor),
          ),
        ],
      ),
    );
  }
}
