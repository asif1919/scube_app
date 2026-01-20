import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable Section Title Widget 
class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;
  final bool showRedDot;

  const SectionTitle({
    super.key,
    required this.title,
    this.fontSize = 24,
    this.color,
    this.showRedDot = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showRedDot) {
      return Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: color ?? Colors.grey[900],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ],
      );
    }

    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color ?? const Color(0xFF082438),
      ),
    );
  }
}
