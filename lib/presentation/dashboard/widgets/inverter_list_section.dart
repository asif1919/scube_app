import 'package:flutter/material.dart';
import 'inverter_card.dart';

class InverterListSection extends StatelessWidget {
  const InverterListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        InverterCard(
          title: 'LT_01',
          capacityText: '495.505 kWp / 440 kW',
          lifetimeEnergy: '352.96',
          todayEnergy: '273.69',
          prevMeterEnergy: '0.00',
          livePower: '352.96',
        ),
        SizedBox(height: 12),
        InverterCard(
          title: 'LT_01',
          capacityText: '495.505 kWp / 440 kW',
          lifetimeEnergy: '352.96',
          todayEnergy: '273.69',
          prevMeterEnergy: '0.00',
          livePower: '352.96',
        ),
      ],
    );
  }
}
