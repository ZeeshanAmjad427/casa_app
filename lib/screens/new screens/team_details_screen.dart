import 'package:flutter/material.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({super.key});

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  final List<String> tabs = ['Players Stats', 'Fixtures', 'Results'];
  String _selectedTab = 'Fixtures';

  // Dummy data for upcoming fixtures
  final List<Map<String, dynamic>> upcomingFixtures = [
    {
      'dateLabel': 'Today',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester United',
      'awayTeam': 'Nottingham',
      'homeTeamImage': 'assets/europe.png', // Placeholder
      'awayTeamImage': 'assets/england.png', // Placeholder
    },
    {
      'dateLabel': 'Tomorrow',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester United',
      'awayTeam': 'Getafe',
      'homeTeamImage': 'assets/england.png', // Placeholder
      'awayTeamImage': 'assets/europe.png', // Placeholder
    },
    {
      'dateLabel': '31st May',
      'time': '08:00 PM',
      'location': 'Old Trafford',
      'homeTeam': 'Manchester United',
      'awayTeam': 'FC Barcelona',
      'homeTeamImage': 'assets/europe.png', // Placeholder
      'awayTeamImage': 'assets/england.png', // Placeholder
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
                        'Team Details',
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
                  // Team logo and name
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
                          'Premier League',
                          style: TextStyle(
                            color: Color(0xFFF1C40F),
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Nottingham',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: tabs.map((tab) {
                        final isSelected = tab == _selectedTab;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = tab;
                            });
                          },
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
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Fixtures header
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
                            Icon(Icons.swap_vert, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Match list
                  Expanded(
                    child: ListView.builder(
                      itemCount: upcomingFixtures.length,
                      itemBuilder: (context, index) {
                        final fixture = upcomingFixtures[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: FixtureCard(
                            dateLabel: fixture['dateLabel'],
                            time: fixture['time'],
                            location: fixture['location'],
                            homeTeamImage: fixture['homeTeamImage'],
                            awayTeamImage: fixture['awayTeamImage'],
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

// Reusable widget for a match fixture card
class FixtureCard extends StatelessWidget {
  final String dateLabel;
  final String time;
  final String location;
  final String homeTeamImage;
  final String awayTeamImage;

  const FixtureCard({
    super.key,
    required this.dateLabel,
    required this.time,
    required this.location,
    required this.homeTeamImage,
    required this.awayTeamImage,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Home Team Image
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Image.asset(
              homeTeamImage, // Placeholder
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Text(
                  dateLabel,
                  style: const TextStyle(
                    color: Color(0xFFF1C40F),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Away Team Image
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Image.asset(
              awayTeamImage, // Placeholder
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
