import 'package:flutter/widgets.dart';

/// Function to calculate the size of a widget using a GlobalKey
/// Returns a Size object containing width and height
Size getWidgetSize(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox != null) {
    return renderBox.size; // Returns the size (width and height)
  }
  return Size.zero; // Fallback in case the widget is not rendered
}
