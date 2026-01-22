import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class InverterCard extends StatelessWidget {
  final String title;
  final String capacityText;
  final String lifetimeEnergy;
  final String todayEnergy;
  final String prevMeterEnergy;
  final String livePower;

  const InverterCard({
    super.key,
    required this.title,
    required this.capacityText,
    required this.lifetimeEnergy,
    required this.todayEnergy,
    required this.prevMeterEnergy,
    required this.livePower,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/dashboard/Asset 1 5.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    capacityText,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.statusBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Divider(
            color: AppColors.borderLight,
            thickness: 1.5,
            height: 5,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _MetricTile(
                assetPath: 'assets/dashboard/Group 1000011086.png',
                title: 'Lifetime Energy',
                value: '$lifetimeEnergy MWh',
              ),
              const SizedBox(width: 12),
              _MetricTile(
                assetPath: 'assets/dashboard/Group 1000011031.png',
                title: 'Today Energy',
                value: '$todayEnergy kWh',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _MetricTile(
                assetPath: 'assets/dashboard/Group 1000010988.png',
                title: 'Prev. Meter Energy',
                value: '$prevMeterEnergy MWh',
              ),
              const SizedBox(width: 12),
              _MetricTile(
                assetPath: 'assets/dashboard/Group 1000010987.png',
                title: 'Live Power',
                value: '$livePower MWh',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String assetPath;
  final String title;
  final String value;

  const _MetricTile({
    required this.assetPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
