import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import 'comparison_row.dart';

class YesterdayTodayTable extends StatelessWidget {
  const YesterdayTodayTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight, width: 0.7),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.02), blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                const Spacer(flex: 3),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Yesterday's Data",
                    textAlign: TextAlign.left,
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
                    "Today's Data",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.borderLight, thickness: 2.0),
          const ComparisonRow(
            label: 'AC Max Power',
            yesterdayValue: '1636.50 kW',
            todayValue: '2121.88 kW',
          ),
          const ComparisonRow(
            label: 'Net Energy',
            yesterdayValue: '6439.16 kWh',
            todayValue: '4875.77 kWh',
            isHighlighted: true,
          ),
          const ComparisonRow(
            label: 'Specific Yield',
            yesterdayValue: '1.25 kWh/kWp',
            todayValue: '0.94 kWh/kWp',
          ),
          const ComparisonRow(
            label: 'Net Energy',
            yesterdayValue: '6439.16 kWh',
            todayValue: '4875.77 kWh',
            isLast: true,
            isHighlighted: true,
          ),
          const ComparisonRow(
            label: 'Specific Yield',
            yesterdayValue: '1.25 kWh/kWp',
            todayValue: '0.94 kWh/kWp',
            isLast: true,
          ),
        ],
      ),
    );
  }
}
