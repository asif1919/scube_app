import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ElectricityDonutChart extends StatelessWidget {
  const ElectricityDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ring
          SizedBox(
            width: 140,
            height: 140,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 22,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation(
                Color(0xFFD6ECFF), // light blue ring
              ),
            ),
          ),
          // Foreground progress arc
          Transform.rotate(
            angle: -3.1416 / 0.1, // start from top
            child: SizedBox(
              width: 140,
              height: 140,
              child: CircularProgressIndicator(
                value: 0.65,
                strokeWidth: 22,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation(
                  AppColors.splashBackground, // solid blue
                ),
              ),
            ),
          ),
          // Center text
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Power',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2A44),
                ),
              ),
              Text(
                '5.53 kw',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2A44),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
