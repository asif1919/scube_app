import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class SourceLoadToggle extends StatelessWidget {
  final bool isSourceSelected;
  final ValueChanged<bool> onSelectionChanged;

  const SourceLoadToggle({
    super.key,
    required this.isSourceSelected,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 254,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.dashboardBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onSelectionChanged(true),
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: isSourceSelected
                      ? AppColors.splashBackground
                      : AppColors.dashboardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Source',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSourceSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onSelectionChanged(false),
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: !isSourceSelected
                      ? AppColors.splashBackground
                      : AppColors.dashboardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Load',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: !isSourceSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
