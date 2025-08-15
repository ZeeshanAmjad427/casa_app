import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive positioning
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0C2461),
      body: Stack(
        children: [
          // Top Right Background Image
          Positioned(
            top: -screenWidth * 0.2,
            right: -screenWidth * 0.3,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/casa_logo.png', // Placeholder
                height: screenHeight * 0.38,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
                        onPressed: () {
                          // TODO: Implement navigation back
                          Navigator.of(context).pop();
                        },
                      ),
                      const Text(
                        'Terms of services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // To balance the back button
                    ],
                  ),
                ),
                // Main Content - The Card with terms
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF2E65A4),
                            Color(0xFF13366C),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'CASA Soccer - ',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Last Updated: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: 'April 24, 2025',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Welcome to CASA Soccer! By using our mobile app and services, you agree to these Terms of Service. Please read them carefully.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 15),
                          _buildSection(
                            title: '1. Eligibility',
                            content: 'You must be 13+ or the legal minimum age in your region to use CASA Soccer.',
                          ),
                          const SizedBox(height: 15),
                          _buildSection(
                            title: '2. Accounts & Access',
                            content: '- Sign in via SportsEngine SSO or approved methods.\n'
                                '- You\'re responsible for keeping your login secure.\n'
                                '- Unauthorized account use is your responsibility.',
                          ),
                          const SizedBox(height: 15),
                          _buildSection(
                            title: '3. Roles & Responsibilities',
                            content: '- Players: RSVP for matches, manage profiles, upload headshots, sign waivers.\n'
                                '- Managers: Manage rosters, report scores, invite players.\n'
                                '- Admins: Full access to teams, players, games, and league settings.',
                          ),
                          const SizedBox(height: 15),
                          _buildSection(
                            title: '4. Profile & Headshots',
                            content: 'Clear headshot uploads are required for roster eligibility. Admins can approve/reject images.',
                          ),
                          const SizedBox(height: 15),
                          _buildSection(
                            title: '5. Updates',
                            content: 'Terms may change over time. Continued use implies acceptance of any changes.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // A reusable helper widget for terms sections
  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
