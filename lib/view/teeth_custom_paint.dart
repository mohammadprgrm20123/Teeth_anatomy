import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as svg;
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchable/touchable.dart';
import '../model/teeth_model.dart';

class TeethCustomPaint extends CustomPainter {
  svg.DrawableRoot drawableRoot;
  BuildContext context;
  List<TeethModel> models;
  final Color selectedColor;
  final Color borderColor;
  final double borderWith;
  final bool showIndex;
  final Color unSelectedColor;
  final TextStyle style;
  final double? textPaddingLeft;
  final double? textPaddingTop;
  void Function(String id, bool isSelected) onTap;

  TeethCustomPaint({
    required this.models,
    required this.context,
    required this.drawableRoot,
    required this.onTap,
    this.unSelectedColor = Colors.black,
    this.selectedColor = Colors.green,
    this.borderColor = Colors.black,
    this.textPaddingTop,
    this.textPaddingLeft,
    this.borderWith = 1,
    this.style = const TextStyle(color: Colors.black, fontSize: 10),
    this.showIndex = false,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    if (size != drawableRoot.viewport.viewBoxRect.size) {
      final double scale = min(
          size.width / drawableRoot.viewport.viewBoxRect.width,
          size.height / drawableRoot.viewport.viewBoxRect.height);
      final scaledHalfViewBoxSize =
          drawableRoot.viewport.viewBoxRect.size * scale / 2.0;
      final halfDesiredSize = size / 2.0;
      final shift = Offset(
        halfDesiredSize.width - scaledHalfViewBoxSize.width,
        halfDesiredSize.height - scaledHalfViewBoxSize.height,
      );

      final fittingMatrix = Matrix4.identity()
        ..translate(shift.dx, shift.dy)
        ..scale(scale);
      final drawables = drawableRoot.children
          .where((final element) => element.hasDrawableContent);

      final bodyPartsCanvas = TouchyCanvas(context, canvas);

      drawPaths(
          showIndex: showIndex,
          touchyCanvas: bodyPartsCanvas,
          plainCanvas: canvas,
          size: size,
          drawables: drawables,
          fittingMatrix: fittingMatrix,
          textPaddingLeft: textPaddingLeft,
          textPaddingTop: textPaddingTop);
    }
  }

  void drawPaths({
    required final TouchyCanvas touchyCanvas,
    required final Canvas plainCanvas,
    required final Size size,
    required final bool showIndex,
    required final Iterable<Drawable> drawables,
    required final Matrix4 fittingMatrix,
    final double? textPaddingLeft,
    final double? textPaddingTop,
  }) {
    for (final element in drawables) {
      final id = element.id;
      if (id == null) {
        continue;
      }
      final path = (element as DrawableShape).path;

      final Paint paint = Paint();
      final isExistInList = models.any((final e) => e.id == id);

      if (isExistInList) {
        paint.color =
            models.firstWhereOrNull((final e) => e.id == id)?.selectedColor ??
                selectedColor;
      } else {
        paint.color =
            models.firstWhereOrNull((final e) => e.id == id)?.unSelectedColor ??
                unSelectedColor;
      }

      touchyCanvas.drawPath(
        element.path.transform(fittingMatrix.storage),
        paint,
        onTapDown: (final _) {
          if (isExistInList) {
            onTap.call(id, false);
          } else {
            onTap.call(id, true);
          }
        },
      );

      plainCanvas.drawPath(
        element.path.transform(fittingMatrix.storage),
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWith
          ..style = PaintingStyle.stroke,
      );

      if (showIndex) {
        drawTextOnPath(
          plainCanvas,
          models.firstWhereOrNull((final e) => e.id == id)?.char ?? id,
          size,
          path,
          textPaddingLeft,
          textPaddingTop,
          textStyle: style,
          fittingMatrix: fittingMatrix,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}

void drawTextOnPath(
  final Canvas canvas,
  final String text,
  final Size size,
  final Path path,
  final double? textPaddingLeft,
  final double? textPaddingTop, {
  required final Matrix4 fittingMatrix,
  final TextStyle textStyle = const TextStyle(),
  final TextDirection textDirection = TextDirection.ltr,
}) {
  if (text.isEmpty) {
    return;
  }

  path.getBounds();

  final textPainter = getTextPainterFor(
    text,
    textStyle,
    textDirection: textDirection,
  );

  canvas.save();

  textPainter.paint(
      canvas,
      Offset(
          path.transform(fittingMatrix.storage).getBounds().center.dx +
              (textPaddingLeft ?? 0),
          path.transform(fittingMatrix.storage).getBounds().center.dy +
              (textPaddingTop ?? 0)));
  canvas.restore();
}

TextPainter getTextPainterFor(
  final String text,
  final TextStyle textStyle, {
  final TextDirection textDirection = TextDirection.rtl,
}) {
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(text: textSpan, textDirection: textDirection);
  textPainter.layout();
  return textPainter;
}
