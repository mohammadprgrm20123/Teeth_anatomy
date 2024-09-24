import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teeth_anatomy/view/teeth_custom_paint.dart';
import 'package:touchable/touchable.dart';

import '../utils/svg_loader.dart';
import '../model/teeth_model.dart';
import 'package:flutter_svg/flutter_svg.dart' as svg;

class TeethWidget extends StatefulWidget {
  final List<TeethModel> teeth;
  final Color? selectedColor;
  final Color? borderColor;
  final double? borderWith;
  final bool? showIndex;
  final Color? unSelectedColor;
  final TextStyle? textStyle;
  final double? textPaddingLeft;
  final double? textPaddingTop;
  final double size;
  final void Function(String id, bool isSelected) onTap;

  const TeethWidget(
      {required this.onTap,
      required this.teeth,
      super.key,
      this.size = 500,
      this.textPaddingLeft,
      this.textPaddingTop,
      this.selectedColor,
      this.textStyle,
      this.borderColor,
      this.borderWith,
      this.showIndex,
      this.unSelectedColor});

  @override
  State<TeethWidget> createState() => _TeethWidgetState();
}

class _TeethWidgetState extends State<TeethWidget> {
  svg.DrawableRoot? drawable;

  List<TeethModel> models = [];

  @override
  void initState() {
    models = widget.teeth;
    WidgetsBinding.instance.addPostFrameCallback((final v) async {
      final value =
          await rootBundle.load('packages/teeth_anatomy/assets/ss.svg');
      drawable = await svg.svg.fromSvgBytes(value.buffer.asUint8List(), 'svg');
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    SvgLoader.instance.loadDrawable(SvgLoader.instance.drawable);
    return ValueListenableBuilder<DrawableRoot?>(
      valueListenable: SvgLoader.instance.drawable,
      builder: (final context, final value, final child) {
        if (value == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return CanvasTouchDetector(
          gesturesToOverride: const [GestureType.onTapDown],
          builder: (final context) => CustomPaint(
            painter: TeethCustomPaint(
                textPaddingLeft: widget.textPaddingLeft,
                textPaddingTop: widget.textPaddingTop,
                borderWith: widget.borderWith ?? 1,
                showIndex: widget.showIndex ?? false,
                unSelectedColor: widget.unSelectedColor ?? Colors.white,
                selectedColor: widget.selectedColor ?? Colors.green,
                borderColor: widget.borderColor ?? Colors.black,
                models: models,
                drawableRoot: value,
                context: context,
                style: widget.textStyle ??
                    const TextStyle(color: Colors.black, fontSize: 10),
                onTap: widget.onTap),
            size: Size(widget.size, widget.size),
          ),
        );
      },
    );
  }
}
