import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/storage/generic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app.notifier.g.dart';

@riverpod
class AppNotifier extends _$AppNotifier with ChangeNotifier {
  @override
  AppNotifier build() {
    // Initialization logic if needed
    return this;
  }

  var activeScreen = GenericStore<int>(2);

  @override
  void dispose() {
    activeScreen.close();

    super.dispose();
  }
}
