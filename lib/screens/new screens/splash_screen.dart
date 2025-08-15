import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circlesFadeAnimation;
  late Animation<double> _starsFadeAndScaleAnimation;
  late Animation<double> _logoFadeAndScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _circlesFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _starsFadeAndScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _logoFadeAndScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          // Base background color
          Container(
            color: const Color(0xFF0A3767), // Solid background color
          ),

          // Animated Concentric Circles
          Center(
            child: FadeTransition(
              opacity: _circlesFadeAnimation,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer-most circle
                  Container(
                    width: screenWidth * 0.9,
                    height: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xFF103A6F),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Second circle
                  Container(
                    width: screenWidth * 0.7,
                    height: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      color: const Color(0xFF19447C),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Third circle
                  Container(
                    width: screenWidth * 0.5,
                    height: screenWidth * 0.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFF204E8A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Innermost circle
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF285698),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Animated Stars
          Center(
            child: AnimatedBuilder(
              animation: _starsFadeAndScaleAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _starsFadeAndScaleAnimation.value,
                  child: Transform.scale(
                    scale: _starsFadeAndScaleAnimation.value,
                    child: Image.asset(
                      'assets/stars.png',
                      width: screenWidth * 0.6,
                    ),
                  ),
                );
              },
            ),
          ),

          // Animated Logo
          Center(
            child: AnimatedBuilder(
              animation: _logoFadeAndScaleAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoFadeAndScaleAnimation.value,
                  child: Transform.scale(
                    scale: _logoFadeAndScaleAnimation.value,
                    child: Image.asset(
                      'assets/casa_logo.png',
                      width: screenWidth * 0.5,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}