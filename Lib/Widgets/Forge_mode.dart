import 'dart:math';
import 'package:flutter/material.dart';

class ForgeModeBackground extends StatefulWidget {
  final Widget child;
  const ForgeModeBackground({required this.child});

  @override
  State<ForgeModeBackground> createState() => _ForgeModeBackgroundState();
}

class _ForgeModeBackgroundState extends State<ForgeModeBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.2,
              colors: [
                Color.lerp(Colors.black, Color(0xFF1B5E20), controller.value)!,
                Colors.black,
                Colors.deepOrange.withOpacity(0.15 * controller.value),
              ],
            ),
          ),
          child: Stack(
            children: [
              ...List.generate(20, (i) => _ember(i)),
              widget.child,
            ],
          ),
        );
      },
    );
  }

  Widget _ember(int i) {
    final random = Random(i);
    return Positioned(
      left: random.nextDouble() * 400,
      top: random.nextDouble() * 800,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Opacity(
            opacity: (random.nextDouble() * controller.value).clamp(0.0, 1.0),
            child: Icon(
              Icons.circle,
              size: random.nextDouble() * 6,
              color: Colors.orangeAccent,
            ),
          );
        },
      ),
    );
  }
}
