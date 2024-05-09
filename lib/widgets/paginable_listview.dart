import 'package:flutter/material.dart';
import 'package:starter_kit_bloc/enums/enums.dart';

class PaginableListView extends StatelessWidget {
  final int itemCount;
  // final int? totalItem;
  bool? isNextPagePossible;
  IndexedWidgetBuilder itemBuilder;
  IndexedWidgetBuilder? separatorBuilder;
  Axis scrollDirection;

  Widget? loadingIndicator;

  Widget? leadingWidget;

  double? leadingWidgetMargin;

  double? suffixMargin;

  ScrollController? scrollController;

  bool isLoadMoreBeingCalled = false;

  late ValueNotifier<PaginableListViewLastItem> valueNotifier;
  late bool isValueNotifierDisposed;
  late Exception exception;

  final Future<void> Function() loadMore;

  PaginableListView({
    super.key,
    required this.itemCount,
    required this.loadMore,
    required this.itemBuilder,
    this.separatorBuilder,
    this.loadingIndicator,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.leadingWidget,
    this.leadingWidgetMargin,
    // this.totalItem,
    this.suffixMargin,
    this.isNextPagePossible,
  }) {
    valueNotifier = ValueNotifier(PaginableListViewLastItem.emptyContainer);

    isValueNotifierDisposed = false;
    isLoadMoreBeingCalled = false;
    scrollController ??= ScrollController();
  }

  Future<void> performPagination() async {
    isLoadMoreBeingCalled = true;
    valueNotifier.value = PaginableListViewLastItem.progressIndicator;

    try {
      loadMore.call();
      if (!isValueNotifierDisposed) {
        // valueNotifier.value = PaginableListViewLastItem.emptyContainer;
      }
    } on Exception {
      // this.exception = exception;
      if (!isValueNotifierDisposed) {
        valueNotifier.value = PaginableListViewLastItem.errorIndicator;
      }
    }
    isLoadMoreBeingCalled = false;
  }

  bool isAlmostAtTheEndOfTheScroll(
          ScrollUpdateNotification scrollUpdateNotification) =>
      scrollUpdateNotification.metrics.pixels >=
      scrollUpdateNotification.metrics.maxScrollExtent * 0.8;

  bool isScrollingDownwards(
          ScrollUpdateNotification scrollUpdateNotification) =>
      scrollUpdateNotification.scrollDelta! > 0.0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (ScrollUpdateNotification scrollUpdateNotification) {
        if (isAlmostAtTheEndOfTheScroll(scrollUpdateNotification) &&
            isScrollingDownwards(scrollUpdateNotification)) {
          if (isNextPagePossible != null) {
            if (isNextPagePossible! && !isLoadMoreBeingCalled) {
              performPagination();
            }
          }
        }
        return false;
      },
      child: ListView.separated(
        scrollDirection: scrollDirection,
        controller: scrollController,
        itemCount: itemCount,
        separatorBuilder: separatorBuilder ??
            (BuildContext context, int index) {
              return SizedBox(
                height: scrollDirection == Axis.vertical ? 24 : null,
                width: scrollDirection == Axis.horizontal ? 24 : null,
              );
            },
        itemBuilder: (context, index) {
          return Flex(
            direction: scrollDirection,
            children: [
              if (leadingWidget != null && index == 0) ...[
                leadingWidget!,
                leadingWidgetMargin != null
                    ? SizedBox(
                        height: scrollDirection == Axis.vertical
                            ? leadingWidgetMargin
                            : null,
                        width: scrollDirection == Axis.horizontal
                            ? leadingWidgetMargin
                            : null,
                      )
                    : const SizedBox(),
              ],
              if (index < itemCount) itemBuilder.call(context, index),
              if (index == itemCount - 1)
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (BuildContext context,
                      PaginableListViewLastItem value, _) {
                    return Flex(
                      direction: scrollDirection,
                      children: [
                        if (value == PaginableListViewLastItem.emptyContainer)
                          const SizedBox(),
                        if (value == PaginableListViewLastItem.errorIndicator)
                          Text(exception.toString()),
                        if (value ==
                            PaginableListViewLastItem.progressIndicator)
                          loadingIndicator ?? const CircularProgressIndicator(),
                        if (suffixMargin != null)
                          SizedBox(
                            height: scrollDirection == Axis.vertical
                                ? suffixMargin
                                : 100,
                            width: scrollDirection == Axis.horizontal
                                ? suffixMargin
                                : 100,
                          )
                      ],
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
