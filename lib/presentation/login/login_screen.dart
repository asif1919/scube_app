import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_routes.dart';
import '../widgets/logo_header.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/underlined_text_button.dart';
import '../widgets/section_title.dart';

/// Login Screen Widget following Clean Architecture
/// This is a presentation layer widget that displays the login form
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    // Start animation after a brief delay
    Future.delayed(const Duration(milliseconds: 100), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topSectionHeight = screenHeight * 0.40; // 40% of screen
    final bottomSectionHeight = screenHeight * 0.60; // 60% of screen

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section - Blue Background with Logo
              SizedBox(
                height: topSectionHeight,
                child: Center(
                  child: LogoHeader(
                    isCentered: false,
                    topPadding: AppConstants.splashTopPadding,
                  ),
                ),
              ),

              // Bottom Section - White Login Form with Animation
              SizedBox(
                height: bottomSectionHeight,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          // Login Title
                          const SectionTitle(title: 'Login'),
                          const SizedBox(height: 25),

                          // Username Field
                          CustomTextField(
                            controller: _usernameController,
                            hintText: 'Username',
                          ),
                          const SizedBox(height: 12),

                          // Password Field
                          PasswordField(
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 5),

                          // Forgot Password Link
                          UnderlinedTextButton(
                            fontSize: 12,
                            text: 'Forgot password?',
                            onPressed: () {},
                            alignment: Alignment.centerRight,
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          CustomButton(
                            height: 60,
                            text: 'Login',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.dashboard,
                          );
                        },
                          ),

                          const SizedBox(height: 10),
                          // Registration Prompt
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have any account?",
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: AppColors.textBlack,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Register Now',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.splashBackground,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
