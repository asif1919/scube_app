import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine temperature and images based on current time
    final now = DateTime.now();
    final totalMinutes = now.hour * 60 + now.minute;

    // Default: morning
    String temperatureValue = '17';
    String temperatureIconAsset = 'assets/dashboard/temp_morning.png';
    String weatherIconAsset = 'assets/dashboard/Morning.png';

    // 11:00 AM – 11:59 AM -> 17°C, morning image
    if (totalMinutes >= 11 * 60 && totalMinutes < 12 * 60) {
      temperatureValue = '17';
      temperatureIconAsset = 'assets/dashboard/temp_morning.png';
      weatherIconAsset = 'assets/dashboard/Morning.png';
    }
    // 12:00 PM – 12:59 PM -> 30°C, afternoon image
    else if (totalMinutes >= 12 * 60 && totalMinutes < 13 * 60) {
      temperatureValue = '30';
      temperatureIconAsset = 'assets/dashboard/temp_afternoon.png';
      weatherIconAsset = 'assets/dashboard/afternoon.png';
    }
    // 2:30 PM – 3:29 PM -> 19°C, night image
    else if (totalMinutes >= (14 * 60 + 30) && totalMinutes < (15 * 60 + 30)) {
      temperatureValue = '19';
      temperatureIconAsset = 'assets/dashboard/temp_night.png';
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
                  colors: [AppColors.gradientBlue, AppColors.gradientPurple],
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
                              // Wind speed - Fixed: Wrapped in FittedBox
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '26',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' MPH / NW',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Wind Label - Fixed: Wrapped in FittedBox
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Wind Speed & Direction',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white.withOpacity(0.9),
                                  ),
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
                                      AppColors.white.withOpacity(0.0),
                                      AppColors.white.withOpacity(1.0),
                                      AppColors.white.withOpacity(0.0),
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                ),
                              ),
                              // Irradiation - Fixed: Wrapped Row in FittedBox
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      '15.20',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Text(
                                      ' w/m²',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Irradiation Label - Fixed: Wrapped in FittedBox
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Effective Irradiation',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white.withOpacity(0.9),
                                  ),
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
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Wrapped Column in Expanded to prevent horizontal overflow in Row
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Temperature Value - Fixed: Wrapped in FittedBox
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                temperatureValue,
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.temperatureBlue,
                                ),
                              ),
                              Text(
                                '°C',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: AppColors.temperatureBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Module Label - Fixed: Wrapped in FittedBox
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Module\nTemperature',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textDarkGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
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