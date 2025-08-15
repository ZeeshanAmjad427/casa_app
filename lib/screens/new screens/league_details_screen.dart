import 'package:flutter/material.dart';

class LeagueDetailsScreen extends StatefulWidget {
  const LeagueDetailsScreen({super.key});

  @override
  State<LeagueDetailsScreen> createState() => _LeagueDetailsScreenState();
}

class _LeagueDetailsScreenState extends State<LeagueDetailsScreen> {
  final List<String> tabs = ['Results', 'Fixtures', 'Standings', 'Stats'];
  String _selectedTab = 'Results';

  // Dummy data for match results
  final List<Map<String, dynamic>> matchResults = [
    {
      'status': 'FT',
      'date': '15/4',
      'homeTeam': 'Manchester United',
      'homeTeamScore': 2,
      'awayTeam': 'Arsenal',
      'awayTeamScore': 2,
    },
    {
      'status': 'FT',
      'date': '15/4',
      'homeTeam': 'Manchester United',
      'homeTeamScore': 2,
      'awayTeam': 'Chelsea',
      'awayTeamScore': 1,
    },
    {
      'status': 'FT',
      'date': '15/4',
      'homeTeam': 'Manchester United',
      'homeTeamScore': 1,
      'awayTeam': 'Manchester City',
      'awayTeamScore': 3,
    },
    {
      'status': 'FT',
      'date': '15/4',
      'homeTeam': 'Manchester United',
      'homeTeamScore': 1,
      'awayTeam': 'Nottingham',
      'awayTeamScore': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0A3767),
      body: Stack(
        children: [
          // Top-right background image (make sure to provide this asset)
          Positioned(
            top: -screenWidth * 0.2,
            right: -screenWidth * 0.3,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/casa_logo.png', // Placeholder, please add your own asset
                height: screenHeight * 0.38,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // App bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Text(
                        'League',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // League logo and name
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            'assets/europe.png', // Placeholder
                            height: 60,
                            width: 60,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Champions League',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Tabs
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        final tab = tabs[index];
                        final isSelected = tab == _selectedTab;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = tab;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tab,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.white54,
                                    fontSize: 16,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                // The gradient container now appears only when selected
                                if (isSelected)
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    height: 3,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFF6F61),
                                          Color(0xFFF99D43),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Results header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Match Results',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF135398),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Sort By',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.sort, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Match results list
                  Expanded(
                    child: ListView.builder(
                      itemCount: matchResults.length,
                      itemBuilder: (context, index) {
                        final result = matchResults[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MatchResultCard(
                            status: result['status'],
                            date: result['date'],
                            homeTeam: result['homeTeam'],
                            homeTeamScore: result['homeTeamScore'],
                            awayTeam: result['awayTeam'],
                            awayTeamScore: result['awayTeamScore'],
                          ),
                        );
                      },
                    ),
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

// Reusable widget for a match result card
class MatchResultCard extends StatelessWidget {
  final String status;
  final String date;
  final String homeTeam;
  final int homeTeamScore;
  final String awayTeam;
  final int awayTeamScore;

  const MatchResultCard({
    super.key,
    required this.status,
    required this.date,
    required this.homeTeam,
    required this.homeTeamScore,
    required this.awayTeam,
    required this.awayTeamScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // Linear gradient applied to the card
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF14457A),
            Color(0xFF0F325A),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFFF1C40F),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                _buildTeamRow(homeTeam, homeTeamScore, isHomeTeam: true),
                const SizedBox(height: 10),
                _buildTeamRow(awayTeam, awayTeamScore, isHomeTeam: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamRow(String teamName, int score, {required bool isHomeTeam}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Placeholder for team logo
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 11,
              child: Image.asset(
                'assets/europe.png',
                height: 22,
                width: 22,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          score.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
