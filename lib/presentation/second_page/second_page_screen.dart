import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'widgets/widgets.dart';

class SecondPageScreen extends StatelessWidget {
  const SecondPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBackground,
      appBar: const SecondPageAppBar(),
      body: const SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:  0),
                child: FirstPageNavigateButton(),
              ),
              SizedBox(height: 10),
              ElectricitySection(),
              SizedBox(height: 16),
              BottomActionGrid(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
