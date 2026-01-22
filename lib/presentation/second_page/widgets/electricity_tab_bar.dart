import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class ElectricityTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const ElectricityTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabItem(
          label: 'Summary',
          index: 0,
          isSelected: selectedIndex == 0,
          onTap: () => onTabSelected(0),
        ),
        _TabItem(
          label: 'SLD',
          index: 1,
          isSelected: selectedIndex == 1,
          onTap: () => onTabSelected(1),
        ),
        _TabItem(
          label: 'Data',
          index: 2,
          isSelected: selectedIndex == 2,
          onTap: () => onTabSelected(2),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.splashBackground : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: !isSelected
                ? const Border(
                    bottom: BorderSide(
                      color: AppColors.borderLight,
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
