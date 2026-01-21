import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class DataViewList extends StatelessWidget {
  const DataViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DataViewCard(
          iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
          title: 'Data View',
          status: 'Active',
          isActive: true,
          data1: '55505.63',
          data2: '58805.63',
          color: AppColors.splashBackground,
        ),
        SizedBox(height: 10),
        DataViewCard(
          iconPath: 'assets/dashboard 2/Asset 2@4x-8 3.png',
          title: 'Data Type 2',
          status: 'Active',
          isActive: true,
          data1: '55505.63',
          data2: '58805.63',
          color: Color(0xFFFFA500),
        ),
        SizedBox(height: 10),
        DataViewCard(
          iconPath: 'assets/dashboard 2/power_15679163 1.png',
          title: 'Data Type 3',
          status: 'Inactive',
          isActive: false,
          data1: '55505.63',
          data2: '58805.63',
          color: Color(0xFF00C0E8),
        ),
        DataViewCard(
          iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
          title: 'Total Solar',
          status: 'Inactive',
          isActive: false,
          data1: '55505.63 kW',
          data2: '58805.63 kWh',
          color: Color(0xFF00C0E8),
        ),
      ],
    );
  }
}

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
    
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: backgroundColor ?? defaultBackgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color.fromARGB(255, 147, 147, 147),
          width: 0.5,
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
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '($status)',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: isActive ? const Color(0xFF0684D9) : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data1 != null
                      ? 'Data 1 : $data1'
                      : livePower != null
                          ? 'Live Power : $livePower'
                          : 'Live Power',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data2 != null
                      ? 'Data 2 : $data2'
                      : todayEnergy != null
                          ? 'Today Energy : $todayEnergy'
                          : 'Today Energy',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
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
}
