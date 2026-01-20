import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable Underlined Text Button Widget 
class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Alignment? alignment;

  const UnderlinedTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor ?? Colors.grey[700],
          decoration: TextDecoration.underline,
          decorationColor: textColor ?? Colors.grey[700],
        ),
      ),
    );

    if (alignment != null) {
      return Align(
        alignment: alignment!,
        child: button,
      );
    }

    return button;
  }
}
