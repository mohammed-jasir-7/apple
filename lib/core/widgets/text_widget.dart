import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.size = 14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.letterSpacing = 0.5,
    this.wordSpacing = 1.0,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.decorationStyle = TextDecorationStyle.solid,
    this.fontStyle = FontStyle.normal,
    this.backgroundColor,
    this.shadow,
    this.height = 1.2,
    this.fontFamily,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final int? maxLines;
  final double letterSpacing;
  final double wordSpacing;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final TextDecoration? decoration;
  final TextDecorationStyle decorationStyle;
  final FontStyle fontStyle;
  final Color? backgroundColor;
  final List<Shadow>? shadow;
  final double height;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: _textStyle(),
    );
  }

  TextStyle _textStyle() {
    return GoogleFonts.getFont(
      fontFamily ?? 'Inter',
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration,
      decorationStyle: decorationStyle,
      fontStyle: fontStyle,
      backgroundColor: backgroundColor,
      shadows: shadow,
      height: height,
    );
  }
}
