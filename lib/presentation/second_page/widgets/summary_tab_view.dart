import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import 'electricity_donut_chart.dart';
import 'source_load_toggle.dart';
import 'scrollable_data_view_list.dart';

class SummaryTabView extends StatefulWidget {
  final ScrollController scrollController;

  const SummaryTabView({
    super.key,
    required this.scrollController,
  });

  @override
  State<SummaryTabView> createState() => _SummaryTabViewState();
}

class _SummaryTabViewState extends State<SummaryTabView> {
  bool _isSourceSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Text(
            'Electricity',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            height: 1,
            color: AppColors.textSecondary,
            thickness: 0.7,
          ),
          const SizedBox(height: 6),
          const ElectricityDonutChart(),
          SourceLoadToggle(
            isSourceSelected: _isSourceSelected,
            onSelectionChanged: (value) {
              setState(() {
                _isSourceSelected = value;
              });
            },
          ),
          const SizedBox(height: 5),
          const Divider(height: 1, color: AppColors.grey600, thickness: 1.5),
          const SizedBox(height: 10),
          ScrollableDataViewList(
            scrollController: widget.scrollController,
          ),
        ],
      ),
    );
  }
}
