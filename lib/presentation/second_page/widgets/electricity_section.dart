import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'electricity_tab_bar.dart';
import 'summary_tab_view.dart';
import 'empty_tab_view.dart';

class ElectricitySection extends StatefulWidget {
  const ElectricitySection({super.key});

  @override
  State<ElectricitySection> createState() => _ElectricitySectionState();
}

class _ElectricitySectionState extends State<ElectricitySection> {
  int _selectedTabIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ElectricityTabBar(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          Container(height: 1, color: AppColors.borderLight),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return SummaryTabView(scrollController: _scrollController);
      case 1:
        return const EmptyTabView(title: 'SLD View');
      case 2:
        return const EmptyTabView(title: 'Data View');
      default:
        return const SizedBox.shrink();
    }
  }
}
