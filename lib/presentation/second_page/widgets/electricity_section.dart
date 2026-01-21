import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import 'dart:math' as math;
import 'data_view_list.dart';

class ElectricitySection extends StatefulWidget {
  const ElectricitySection({super.key});

  @override
  State<ElectricitySection> createState() => _ElectricitySectionState();
}

class _ElectricitySectionState extends State<ElectricitySection> {
  bool _isSourceSelected = true;
  int _selectedTabIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      child: Column(
        children: [
          // Tab Bar at the top
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _selectedTabIndex == 0
                          ? const Color(0xFF00C0E8)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Summary',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _selectedTabIndex == 0
                            ? Colors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedTabIndex == 1
                              ? Colors.transparent
                              : AppColors.borderLight,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'SLD',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedTabIndex == 2
                              ? Colors.transparent
                              : AppColors.borderLight,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Data',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(height: 1, color: AppColors.borderLight),
          // Electricity Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Electricity',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(height: 1, color: AppColors.borderLight),
                const SizedBox(height: 20),
                // Donut Chart
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(150, 150),
                        painter: DonutChartPainter(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Power',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '5.53 kw',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Source/Load Toggle
                Container(
                  width: 254,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFF3F4F6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isSourceSelected = true),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: _isSourceSelected
                                  ? const Color(0xFF00C0E8)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'Source',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: _isSourceSelected
                                      ? Colors.white
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _isSourceSelected = false),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: !_isSourceSelected
                                  ? const Color(0xFF00C0E8)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'Load',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: !_isSourceSelected
                                      ? Colors.white
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(height: 1, color: Colors.grey, thickness: 1.5),
                const SizedBox(height: 10),
                // Data View Cards with Scrollable Container
                SizedBox(
                  height: 270, // Height for 3 cards (approximately 90px per card)
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: const [
                            DataViewCard(
                              iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
                              title: 'Data View',
                              status: 'Active',
                              isActive: true,
                              data1: '55505.63',
                              data2: '58805.63',
                              color: Color(0xFF00C0E8),
                            ),
                            SizedBox(height: 10),
                            DataViewCard(
                              iconPath: 'assets/dashboard 2/Asset 2@4x-8 3.png',
                              title: 'Data Type 2',
                              status: 'Active',
                              isActive: true,
                              data1: '55505.63',
                              data2: '58805.63',
                              color: Color(0xFFFFA500),
                            ),
                            SizedBox(height: 10),
                            DataViewCard(
                              iconPath: 'assets/dashboard 2/power_15679163 1.png',
                              title: 'Data Type 3',
                              status: 'Inactive',
                              isActive: false,
                              data1: '55505.63',
                              data2: '58805.63',
                              color: Color(0xFF00C0E8),
                            ),
                            SizedBox(height: 10),
                            DataViewCard(
                              iconPath: 'assets/dashboard 2/solar-cell_5575136 1.png',
                              title: 'Total Solar',
                              status: 'Active',
                              isActive: true,
                              livePower: '55505.63 kW',
                              todayEnergy: '58805.63 kWh',
                              color: Color.fromARGB(255, 200, 201, 201),
                            ),
                          ],
                        ),
                      ),
                      // Custom Scrollbar on the right
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: _CustomScrollbar(
                          controller: _scrollController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    // Draw larger section (70-75%)
    final paint1 = Paint()
      ..color = const Color(0xFF0684D9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;
    final rect1 = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect1, -math.pi / 2, 2 * math.pi * 0.72, false, paint1);

    // Draw smaller section (25-30%)
    final paint2 = Paint()
      ..color = const Color(0xFF7DD3FC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;
    canvas.drawArc(
      rect1,
      -math.pi / 2 + 2 * math.pi * 0.72,
      2 * math.pi * 0.28,
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CustomScrollbar extends StatefulWidget {
  final ScrollController controller;

  const _CustomScrollbar({required this.controller});

  @override
  State<_CustomScrollbar> createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<_CustomScrollbar> {
  double _scrollPosition = 0.0;
  double _scrollExtent = 0.0;
  double _viewportDimension = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateScrollPosition);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateScrollPosition);
    super.dispose();
  }

  void _updateScrollPosition() {
    if (widget.controller.hasClients) {
      setState(() {
        _scrollPosition = widget.controller.position.pixels;
        _scrollExtent = widget.controller.position.maxScrollExtent;
        _viewportDimension = widget.controller.position.viewportDimension;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.controller.hasClients || _scrollExtent <= 0) {
      return const SizedBox.shrink();
    }

    final totalHeight = _scrollExtent + _viewportDimension;
    final thumbHeight = ((_viewportDimension / totalHeight) * _viewportDimension).clamp(30.0, double.infinity);
    final maxThumbPosition = _viewportDimension - thumbHeight;
    final thumbPosition = _scrollExtent > 0 
        ? ((_scrollPosition / _scrollExtent) * maxThumbPosition).clamp(0.0, maxThumbPosition)
        : 0.0;

    return GestureDetector(
      onVerticalDragStart: (details) {
        // Allow dragging from anywhere on the scrollbar
      },
      onVerticalDragUpdate: (details) {
        if (widget.controller.hasClients && _scrollExtent > 0) {
          final delta = details.delta.dy;
          final scrollRatio = maxThumbPosition > 0 ? delta / maxThumbPosition : 0.0;
          final scrollDelta = scrollRatio * _scrollExtent;
          final newPosition = (widget.controller.position.pixels + scrollDelta)
              .clamp(0.0, widget.controller.position.maxScrollExtent);
          widget.controller.jumpTo(newPosition);
        }
      },
      child: Container(
        width: 8,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: thumbPosition,
              child: Container(
                width: 8,
                height: thumbHeight,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
