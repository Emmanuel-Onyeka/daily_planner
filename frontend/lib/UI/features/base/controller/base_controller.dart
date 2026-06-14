import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseNotifier extends Notifier<BaseState> {
  final PageController _pageController = PageController();

  @override
  BaseState build() {
    return BaseState();
  }

  PageController get pageController => _pageController;

  void changeIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    state = state.copyWith(currentTabIndex: index);
  }
}

final baseNotifierProvider = NotifierProvider<BaseNotifier, BaseState>(
  BaseNotifier.new,
);

class BaseState {
  final int currentTabIndex;

  const BaseState({this.currentTabIndex = 0});

  BaseState copyWith({int? currentTabIndex}) {
    return BaseState(currentTabIndex: currentTabIndex ?? this.currentTabIndex);
  }
}
