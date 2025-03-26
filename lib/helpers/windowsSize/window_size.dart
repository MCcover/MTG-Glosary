import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> setWindowSize({required double width, required double height}) async {
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    var size = Size(width, height);

    WindowManager.instance.setMinimumSize(size);
    WindowManager.instance.setSize(size);
  }
}
