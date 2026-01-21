import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/metric_card.dart';
import '../widgets/comparison_row.dart';
import '../widgets/summary_tile.dart';
import '../widgets/inverter_card.dart';

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
        appBar: AppBar(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 20),
            color: AppColors.textPrimary,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          centerTitle: true,
          title: Text(
            '1st Page',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  color: AppColors.textPrimary,
                  onPressed: () {},
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _SecondPageBanner(),
                SizedBox(height: 13),
                _MetricsGrid(),
                SizedBox(height: 13),
                _WeatherSection(),
                SizedBox(height: 13),
                _YesterdayTodayTable(),
                SizedBox(height: 13),
                _PlantSummarySection(),
                SizedBox(height: 16),
                _InverterListSection(),
                SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MetricsGrid extends StatelessWidget {
  const _MetricsGrid();

  @override
  Widget build(BuildContext context) {
    // FIX: Using GridView to get exactly 2 columns that fill width
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 2.8, // Adjust this ratio to make cards taller/shorter
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

class _WeatherSection extends StatelessWidget {
  const _WeatherSection();

  @override
  Widget build(BuildContext context) {
    // Determine temperature and images based on current time
    final now = DateTime.now();
    final totalMinutes = now.hour * 60 + now.minute;

    // Default: morning
    String temperatureValue = '17';
    String temperatureIconAsset = 'assets/dashboard/Group 1000010973.png';
    String weatherIconAsset = 'assets/dashboard/Morning.png';

    // 11:00 AM – 11:59 AM -> 17°C, morning image, Group 1000010973 (2).png
    if (totalMinutes >= 11 * 60 && totalMinutes < 12 * 60) {
      temperatureValue = '17';
      temperatureIconAsset = 'assets/dashboard/Group 1000010973 (2).png';
      weatherIconAsset = 'assets/dashboard/Morning.png';
    }
    // 12:00 PM – 12:59 PM -> 30°C, afternoon image, Group 1000010973 (1).png
    else if (totalMinutes >= 12 * 60 && totalMinutes < 13 * 60) {
      temperatureValue = '30';
      temperatureIconAsset = 'assets/dashboard/Group 1000010973 (1).png';
      weatherIconAsset = 'assets/dashboard/afternoon.png';
    }
    // 2:30 PM – 3:29 PM -> 19°C, night image, Group 1000010973.png
    else if (totalMinutes >= (14 * 60 + 30) && totalMinutes < (15 * 60 + 30)) {
      temperatureValue = '19';
      temperatureIconAsset = 'assets/dashboard/Group 1000010973.png';
      weatherIconAsset = 'assets/dashboard/night.png';
    }

    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          // Full-width gradient background (right panel)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF2E63F7), Color(0xFFB982D9)],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Reserve space under the white temperature card
                  const SizedBox(width: 150),
                  // Right-side content (wind speed & irradiation)
                  Expanded(
                    child: Row(
                      children: [
                        // Metrics column aligned to right side
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Wind speed
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '26',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' MPH / NW',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Wind Speed & Direction',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              // Divider line
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 30,
                                  top: 3,
                                  bottom: 1,
                                ),
                                height: 0.3,
                                width: 65,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(
                                        0.0,
                                      ), // left faded
                                      Colors.white.withOpacity(
                                        1.0,
                                      ), // middle white
                                      Colors.white.withOpacity(
                                        0.0,
                                      ), // right faded
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                ),
                              ),
                              // Irradiation
                              Row(
                                children: [
                                  Text(
                                    '15.20',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' w/m²',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Effective Irradiation',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Weather icon on far right
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            weatherIconAsset,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Top-left white temperature card over the gradient
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 80,
              width: 155,
              padding: const EdgeInsets.fromLTRB(12, 0, 5, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            temperatureValue,
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF0090FF),
                            ),
                          ),
                          Text(
                            '°C',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: const Color(0xFF0090FF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Module\nTemperature',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  Image.asset(
                    temperatureIconAsset,
                    width: 33,
                    height: 72,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _YesterdayTodayTable extends StatelessWidget {
  const _YesterdayTodayTable();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight, width: 0.7),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.02), blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                const Spacer(flex:3),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Yesterday's Data",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                     
                color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Today's Data",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      
                color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.borderLight, thickness: 2.0),
          const ComparisonRow(
            label: 'AC Max Power',
            yesterdayValue: '1636.50 kW',
            todayValue: '2121.88 kW',
          ),
          const ComparisonRow(
            label: 'Net Energy',
            yesterdayValue: '6439.16 kWh',
            todayValue: '4875.77 kWh',
            isHighlighted: true,
          ),
          const ComparisonRow(
            label: 'Specific Yield',
            yesterdayValue: '1.25 kWh/kWp',
            todayValue: '0.94 kWh/kWp',
          ),
          const ComparisonRow(
            label: 'Net Energy',
            yesterdayValue: '6439.16 kWh',
            todayValue: '4875.77 kWh',
            isLast: true,
            isHighlighted: true,
          ),
           const ComparisonRow(
            label: 'Specific Yield',
            yesterdayValue: '1.25 kWh/kWp',
            todayValue: '0.94 kWh/kWp',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _PlantSummarySection extends StatelessWidget {
  const _PlantSummarySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/dashboard/Total Num of PV Module.png',
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Num of PV Module   ',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ':   6372 pcs. (585 Wp each)',
                        style: GoogleFonts.inter(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Group 1000011062.png',
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Total DC Capacity-1.png',
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Date of Commissioning.png',
                title: 'Date of Commissioning',
                value: '17/07/2024',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Number of Inverter.png',
                title: 'Number of Inverter',
                value: '30',
              ),
            ),
          ],
        ),
         const SizedBox(height: 8),
         Row(
          children: const [
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Group 1000011062.png',
                title: 'Total AC Capacity',
                value: '3000 KW',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryTile(
                assetPath: 'assets/dashboard/Total DC Capacity.png',
                title: 'Total DC Capacity',
                value: '3.727 MWp',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InverterListSection extends StatelessWidget {
  const _InverterListSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        InverterCard(
          title: 'LT_01',
          capacityText: '495.505 kWp / 440 kW',
          lifetimeEnergy: '352.96',
          previousEnergy: '0.00',
          todayEnergy: '273.69',
          livePower: '352.96',
        ),
        SizedBox(height: 12),
        InverterCard(
          title: 'LT_01',
          capacityText: '495.505 kWp / 440 kW',
          lifetimeEnergy: '352.96',
          previousEnergy: '0.00',
          todayEnergy: '273.69',
          livePower: '352.96',
        ),
      ],
    );
  }
}

class _SecondPageBanner extends StatelessWidget {
  const _SecondPageBanner();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF00C0E8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '2nd Page Navigate',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
        ],
      ),
    );
  }
}
