import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/login');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.dashboardBackground,
        appBar: const DashboardAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SecondPageBanner(),
                SizedBox(height: 13),
                MetricsGrid(),
                SizedBox(height: 13),
                WeatherSection(),
                SizedBox(height: 13),
                YesterdayTodayTable(),
                SizedBox(height: 13),
                PlantSummarySection(),
                SizedBox(height: 16),
                InverterListSection(),
                SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
