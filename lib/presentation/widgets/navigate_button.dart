import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigateButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? iconSpacing;

  const NavigateButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF00c0e8),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: iconSpacing ?? 12),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
