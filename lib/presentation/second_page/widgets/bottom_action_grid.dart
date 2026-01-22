import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class BottomActionGrid extends StatelessWidget {
  const BottomActionGrid({super.key});

  final List<Map<String, String>> _actions = const [
    {
      'icon': 'assets/dashboard 2/chart_490605.png',
      'label': 'Analysis Pro',
    },
    {
      'icon': 'assets/dashboard 2/generator_8789846.png',
      'label': 'G. Generator',
    },
    {
      'icon': 'assets/dashboard 2/charge_7345374 1.png',
      'label': 'Plant Summary',
    },
    {
      'icon': 'assets/dashboard 2/fire_3900509 1.png',
      'label': 'Natural Gas',
    },
    {
      'icon': 'assets/dashboard 2/generator_8789846-1.png',
      'label': 'D. Generator',
    },
    {
      'icon': 'assets/dashboard 2/faucet_1078798.png',
      'label': 'Water Process',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _actions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          childAspectRatio: 3.7,
        ),
        itemBuilder: (context, index) {
          final item = _actions[index];
          return ActionButton(
            iconPath: item['icon']!,
            label: item['label']!,
          );
        },
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
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
         
        border: Border.all( 
          color: const Color(0xFFD1D5DB),  
          width: 1.5, 
        ), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}