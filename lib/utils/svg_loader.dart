


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A singleton service that loads the SVGs for the body sides.
class SvgLoader {
  SvgLoader._() {
    _init();
  }

  static final SvgLoader _instance = SvgLoader._();

  /// The singleton instance of [SvgLoader].
  static SvgLoader get instance => _instance;

  final ValueNotifier<DrawableRoot?> drawable = ValueNotifier(null);


  Future<void> _init() async {
    await Future.wait([
      loadDrawable(drawable),
    ]);
  }

  Future<void> loadDrawable(
      final ValueNotifier<Drawable?> notifier,
      ) async {
    final svgBytes = await rootBundle.load(
      'packages/teeth_anatomy/lib/ss.svg',
    );
    notifier.value =
    await svg.fromSvgBytes(svgBytes.buffer.asUint8List(), "svg");
  }
}
