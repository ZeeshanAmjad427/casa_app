import 'package:flutter/material.dart';
import 'dart:math' as math;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background color
          Container(
            color: const Color(0xFF0A3767),
          ),

          // --- Corrected Concentric Circles Effect with More Subtle Colors ---
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.6,
            child: OverflowBox(
              alignment: Alignment.topCenter,
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer-most circle (blends seamlessly with the background)
                  Container(
                    width: screenWidth * 1.2,
                    height: screenWidth * 1.2,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0B3A6C), // Very slightly lighter
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Second circle
                  Container(
                    width: screenWidth * 0.9,
                    height: screenWidth * 0.9,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0E417A), // A bit lighter
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Third circle
                  Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF134789), // Lighter still
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Innermost circle (lightest and most prominent shade)
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A529B), // The lightest circle
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Green shapes background image
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/green_shapes.png',
              width: screenWidth * 0.6,
              fit: BoxFit.cover,
            ),
          ),

          // Player image
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.0,
            child: Image.asset(
              'assets/player.png',
              height: screenHeight * 0.5,
              fit: BoxFit.contain,
            ),
          ),

          // Text and button section
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to CASA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  'Players, By Players',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE5B80B),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Create your dream squad, join matches, \nand play the beautiful game \nyour way.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // The CircularProgressIndicator around the button
                      SizedBox(
                        width: 80, // Same width as the parent SizedBox
                        height: 80, // Same height as the parent SizedBox
                        child: const CircularProgressIndicator(
                          value: 0.25, // 25% filled
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E8B57)), // The filled portion color
                          backgroundColor: Colors.white24, // The unfilled portion color
                        ),
                      ),
                      // The button itself
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E8B57), // Green button color
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),              ],
            ),
          ),
        ],
      ),
    );
  }
}