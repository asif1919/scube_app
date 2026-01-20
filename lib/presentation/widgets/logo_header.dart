import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

/// Reusable Logo Header Widget
/// Displays the app logo, name, and subtitle
/// Used in splash screen and login screen
class LogoHeader extends StatelessWidget {
  final bool isCentered;
  final double? topPadding;

  const LogoHeader({
    super.key,
    this.isCentered = true,
    this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (topPadding != null) SizedBox(height: topPadding),
        // Logo
        Image.asset(
          AppConstants.logoPath,
          height: AppConstants.logoHeight,
          width: AppConstants.logoWidth,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24), 
        Text(
          AppConstants.appName,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.0,
            letterSpacing: 0,
            color: AppColors.splashText,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8), 
        Text(
          AppConstants.appSubtitle,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.4,
            letterSpacing: 0,
            color: AppColors.splashText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );

    return isCentered ? Center(child: content) : content;
  }
}
