import 'package:flutter/material.dart';
import 'metric_card.dart';

class MetricsGrid extends StatelessWidget {
  const MetricsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 2.8,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: const [
        MetricCard(
          title: '10000 kW',
          subtitle: 'Live AC Power',
          assetPath: 'assets/dashboard/Live AC Power.png',
          iconBackground: Color(0xFFF4EAFF),
        ),
        MetricCard(
          title: '82.58 %',
          subtitle: 'Plant Generation',
          assetPath: 'assets/dashboard/Plant Generation.png',
          iconBackground: Color(0xFFF4EAFF),
        ),
        MetricCard(
          title: '85.61 %',
          subtitle: 'Live PR',
          assetPath: 'assets/dashboard/Live PR.png',
          iconBackground: Color(0xFFF4EAFF),
        ),
        MetricCard(
          title: '27.58 %',
          subtitle: 'Cumulative PR',
          assetPath: 'assets/dashboard/Cumulative PR.png',
          iconBackground: Color(0xFFF4EAFF),
        ),
        MetricCard(
          title: '10000 ৳',
          subtitle: 'Return PV',
          assetPath: 'assets/dashboard/Return PV(Till Today).png',
          iconBackground: Color(0xFFF4EAFF),
        ),
        MetricCard(
          title: '10000 kWh',
          subtitle: 'Total Energy',
          assetPath: 'assets/dashboard/Total Energy.png',
          iconBackground: Color(0xFFF4EAFF),
        ),
      ],
    );
  }
}




