import 'package:flutter/material.dart';
import 'package:scube_app/core/constants/app_colors.dart';
import 'package:scube_app/core/constants/app_routes.dart';
import 'package:scube_app/presentation/widgets/custom_app_bar.dart';
import 'package:scube_app/presentation/widgets/navigate_button.dart';
import 'package:scube_app/presentation/dashboard/widgets/widgets.dart';

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
        appBar: CustomAppBar(
          title: '1st Page',
          onBackPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigateButton(
                  text: '2nd Page Navigate',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.secondPage);
                  },
                  iconSpacing: 8,
                ),
                const SizedBox(height: 13),
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
