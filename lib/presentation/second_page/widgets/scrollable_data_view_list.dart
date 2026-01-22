import 'package:flutter/material.dart';
import 'data_view_list.dart';
import 'custom_scrollbar.dart';

class ScrollableDataViewList extends StatelessWidget {
  final ScrollController scrollController;

  const ScrollableDataViewList({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: const Column(
              children: [
                DataViewCard(
                  iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
                  title: 'Data View',
                  status: 'Active',
                  isActive: true,
                  data1: '55505.63',
                  data2: '58805.63',
                  color: Color(0xFF78c6ff),
                  backgroundColor: Color(0xFFE5F4FE),
                ),
                SizedBox(height: 8),
                DataViewCard(
                  iconPath: 'assets/dashboard 2/Asset 2@4x-8 3.png',
                  title: 'Data Type 2',
                  status: 'Active',
                  isActive: true,
                  data1: '55505.63',
                  data2: '58805.63',
                  color: Color(0xFFFFA500),
                  backgroundColor: Color(0xFFE5F4FE),
                ),
                SizedBox(height: 8),
                DataViewCard(
                  iconPath: 'assets/dashboard 2/power_15679163 1.png',
                  title: 'Data Type 3',
                  status: 'Inactive',
                  isActive: false,
                  data1: '55505.63',
                  data2: '58805.63',
                  color: Color(0xFF78c6ff),
                  backgroundColor: Color(0xFFE5F4FE),
                ),
                SizedBox(height: 8),
                DataViewCard(
                  iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
                  title: 'Total Solar',
                  status: 'Active',
                  isActive: true,
                  livePower: '55505.63 kW',
                  todayEnergy: '58805.63 kWh',
                  color: Color(0xFF78c6ff),
                  backgroundColor: Color(0xFFF0F1FF),
                ),
              ],
            ),
          ),
          // Custom Scrollbar on the right
          Positioned(
            right: -5,
            top: 0,
            bottom: 0,
            child: CustomScrollbar(controller: scrollController),
          ),
        ],
      ),
    );
  }
}
