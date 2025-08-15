import 'package:flutter/material.dart';

class LeagueFixturesScreen extends StatefulWidget {
  const LeagueFixturesScreen({super.key});

  @override
  State<LeagueFixturesScreen> createState() => _LeagueFixturesScreenState();
}

class _LeagueFixturesScreenState extends State<LeagueFixturesScreen> {
  // Tabs for the screen
  final List<String> tabs = ['Results', 'Fixtures', 'Standings', 'Stats'];
  // The currently selected tab
  String _selectedTab = 'Fixtures';

  // Dummy data for upcoming matches, structured to match the new card design
  final List<Map<String, dynamic>> upcomingMatches = [
    {
      'date': 'Today',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester',
      'awayTeam': 'Nottingham',
    },
    {
      'date': 'Tomorrow',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester',
      'awayTeam': 'Getafe',
    },
    {
      'date': '31st May',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester',
      'awayTeam': 'FC Barcelona',
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
          // Top-right background image for a subtle effect
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

          // Main content area with padding
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // App bar with back button, title, and notification icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                        onPressed: () {
                          // TODO: Implement navigation back
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
                  // League logo and name section
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            'assets/europe.png', // Placeholder for league logo
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
                  // Tabs for navigation
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
                                // Gradient underline for the selected tab
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
                  // Upcoming Schedule header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Upcoming Schedule',
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
                  // Upcoming matches list
                  Expanded(
                    child: ListView.builder(
                      itemCount: upcomingMatches.length,
                      itemBuilder: (context, index) {
                        final match = upcomingMatches[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: UpcomingMatchCard(
                            date: match['date'],
                            time: match['time'],
                            location: match['location'],
                            homeTeam: match['homeTeam'],
                            awayTeam: match['awayTeam'],
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

// Reusable widget for an upcoming match card
class UpcomingMatchCard extends StatelessWidget {
  final String date;
  final String time;
  final String location;
  final String homeTeam;
  final String awayTeam;

  const UpcomingMatchCard({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.homeTeam,
    required this.awayTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
        // Use CrossAxisAlignment.center to align content vertically
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Home team column, wrapped in Expanded for equal spacing
          Expanded(
            child: _buildTeamColumn(homeTeam, isHomeTeam: true),
          ),
          // Match details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the text within the column
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFFF1C40F),                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color(0xFFFF6F61),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          // Away team column, wrapped in Expanded for equal spacing
          Expanded(
            child: _buildTeamColumn(awayTeam, isHomeTeam: false),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(String teamName, {required bool isHomeTeam}) {
    return Column(
      children: [
        // Placeholder for team logo
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: Image.asset(
            isHomeTeam ? 'assets/europe.png' : 'assets/europe.png', // Placeholders
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          teamName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
