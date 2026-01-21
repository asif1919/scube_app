import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import 'summary_tile.dart';

class PlantSummarySection extends StatelessWidget {
  const PlantSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/dashboard/Total Num of PV Module.png',
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Num of PV Module   ',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ':   6372 pcs. (585 Wp each)',
                        style: GoogleFonts.inter(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Group 1000011062.png',
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Total DC Capacity-1.png',
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Date of Commissioning.png',
                title: 'Date of Commissioning',
                value: '17/07/2024',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Number of Inverter.png',
                title: 'Number of Inverter',
                value: '30',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Group 1000011062.png',
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Total DC Capacity.png',
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
