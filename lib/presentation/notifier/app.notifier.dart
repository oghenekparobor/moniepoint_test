import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/app_strings.dart';
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

  List<String> allImages = [
    Strings.img1,
    Strings.img2,
    Strings.img3,
    Strings.img4,
    Strings.img5,
    Strings.img6,
    Strings.img7,
  ];

  List<String> get images {
    // allImages.shuffle(Random());

    return allImages.take(4).toList();
  }

  var buyCounter = GenericStore<int>(100);
  var rentCounter = GenericStore<int>(100);
}
