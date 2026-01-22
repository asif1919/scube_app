import 'package:flutter/material.dart';
import 'package:scube_app/core/constants/app_colors.dart';
import 'package:scube_app/core/constants/app_routes.dart';
import 'package:scube_app/presentation/widgets/custom_app_bar.dart';
import 'package:scube_app/presentation/widgets/navigate_button.dart';
import 'package:scube_app/presentation/second_page/widgets/widgets.dart';

class SecondPageScreen extends StatelessWidget {
  const SecondPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      appBar: const CustomAppBar(
        title: '2nd Page',
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  0),
                child: NavigateButton(
                  text: '1st Page Navigate',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                  },
                ),
              ),
              const SizedBox(height: 12),
              const ElectricitySection(), 
              const BottomActionGrid(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
