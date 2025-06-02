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
  const AppPage({
    super.key,
    required this.children,
    this.header,
    this.topRounded = true,
    this.scroll = true,
    this.gridView = false,
    this.scrollController,
    this.pageStorageKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppPageTheme>()!;

    return scroll
        ? _PageCustomScrollView(
          scrollController: scrollController,
          pageStorageKey: pageStorageKey,
          gridView: gridView,
          theme: theme,
          header: header,
          children: children,
        )
        : _PageView(theme: theme, header: header, children: children);
  }
}

class _PageView extends StatelessWidget {
  final Widget? header;
  final List<Widget> children;
  final AppPageTheme theme;
  const _PageView({required this.children, required this.theme, this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(width: double.infinity),
        header != null ? header! : SizedBox(),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: theme.style.verticalPadding,
              horizontal: theme.style.horizontalPadding,
            ),
            decoration: BoxDecoration(
              color: theme.style.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(theme.style.verticalPadding),
                topRight: Radius.circular(theme.style.verticalPadding),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: _withVerticalGaps(children, theme.style.verticalGap),
            ),
          ),
        ),
      ],
    );
  }
}

class _PageCustomScrollView extends StatelessWidget {
  final ScrollController? scrollController;
  final Widget? header;
  final bool gridView;
  final List<Widget> children;
  final AppPageTheme theme;
  final String? pageStorageKey;
  const _PageCustomScrollView({
    required this.gridView,
    required this.children,
    required this.theme,
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
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(
              child: Container(
                color: theme.style.appBackgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.style.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(theme.style.verticalPadding),
                      topRight: Radius.circular(theme.style.verticalPadding),
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
              padding: EdgeInsets.only(
                bottom: theme.style.verticalPadding,
                left: theme.style.horizontalPadding,
                right: theme.style.horizontalPadding,
              ),
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
                              childAspectRatio: 5 / 4.5,
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
