import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      this.title,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.letterSpacing,
      this.fontStyle,
      this.textAlign})
      : super(key: key);

  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "Empty",
      style: GoogleFonts.poppins(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontStyle: fontStyle ?? FontStyle.normal,
          letterSpacing: letterSpacing ?? 0),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
