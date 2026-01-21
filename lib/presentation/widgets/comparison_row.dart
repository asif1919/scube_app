import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class ComparisonRow extends StatelessWidget {
  final String label;
  final String yesterdayValue;
  final String todayValue;
  final bool isLast;
  final bool isHighlighted;

  const ComparisonRow({
    super.key,
    required this.label,
    required this.yesterdayValue,
    required this.todayValue,
    this.isLast = false,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFEEF3F9) : Colors.transparent,
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: AppColors.borderLight, width: 0.7),
              ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              yesterdayValue,
              textAlign: TextAlign.left, // Aligned right
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              todayValue,
              textAlign: TextAlign.right, // Aligned right
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}