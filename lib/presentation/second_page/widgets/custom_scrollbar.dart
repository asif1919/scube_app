import 'package:flutter/material.dart';

class CustomScrollbar extends StatefulWidget {
  final ScrollController controller;

  const CustomScrollbar({super.key, required this.controller});

  @override
  State<CustomScrollbar> createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
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
    final thumbHeight = ((_viewportDimension / totalHeight) * _viewportDimension)
        .clamp(30.0, double.infinity);
    final maxThumbPosition = _viewportDimension - thumbHeight;
    final thumbPosition = _scrollExtent > 0
        ? ((_scrollPosition / _scrollExtent) * maxThumbPosition)
            .clamp(0.0, maxThumbPosition)
        : 0.0;

    return GestureDetector(
      onVerticalDragStart: (details) {
        // Allow dragging from anywhere on the scrollbar
      },
      onVerticalDragUpdate: (details) {
        if (widget.controller.hasClients && _scrollExtent > 0) {
          final delta = details.delta.dy;
          final scrollRatio =
              maxThumbPosition > 0 ? delta / maxThumbPosition : 0.0;
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
