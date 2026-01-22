import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class DataViewCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String status;
  final bool isActive;
  final String? data1;
  final String? data2;
  final String? livePower;
  final String? todayEnergy;
  final Color color;
  final Color? backgroundColor;

  const DataViewCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.status,
    required this.isActive,
    this.data1,
    this.data2,
    this.livePower,
    this.todayEnergy,
    required this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = AppColors.splashBackground.withAlpha(25);

    
    // Logic for Row 1
    String label1;
    if (data1 != null) {
      label1 = 'Data 1    : ';
    } else if (livePower != null) {
      label1 = 'Live Power      : '; // Preserving your specific spacing
    } else {
      label1 = 'Live Power';
    }
    final String value1 = data1 ?? livePower ?? '';

    // Logic for Row 2
    String label2;
    if (data2 != null) {
      label2 = 'Data 2    : ';
    } else if (todayEnergy != null) {
      label2 = 'Today Energy : ';
    } else {
      label2 = 'Today Energy';
    }
    final String value2 = data2 ?? todayEnergy ?? '';
    
    // ----------------------------------------------------

    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: backgroundColor ?? defaultBackgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.textSecondary.withAlpha(75),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24, fit: BoxFit.contain),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      ' ($status)',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: isActive ? AppColors.statusBlue : AppColors.errorRed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 2. Use the helper method for cleaner UI code
                _buildInfoRow(label1, value1),
                const SizedBox(height: 4),
                _buildInfoRow(label2, value2),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  // 3. Reusable Helper Method for the Data Rows
  Widget _buildInfoRow(String label, String value) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: label,
            style: TextStyle(color: AppColors.textSecondary),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppColors.textBlack, // Value color is Black
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}