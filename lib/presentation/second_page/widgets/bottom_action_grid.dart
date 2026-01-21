import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class BottomActionGrid extends StatelessWidget {
  const BottomActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/chart_490605.png',
                  label: 'Analysis Pro',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/generator_8789846.png',
                  label: 'G. Generator',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/charge_7345374 1.png',
                  label: 'Plant Summery',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/fire_3900509 1.png',
                  label: 'Natural Gas',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/generator_8789846-1.png',
                  label: 'D. Generator',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  iconPath: 'assets/dashboard 2/faucet_1078798.png',
                  label: 'Water Process',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String iconPath;
  final String label;

  const ActionButton({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
