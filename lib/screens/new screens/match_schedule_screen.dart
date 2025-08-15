import 'package:flutter/material.dart';

class MatchScheduleScreen extends StatefulWidget {
  const MatchScheduleScreen({super.key});

  @override
  State<MatchScheduleScreen> createState() => _MatchScheduleScreenState();
}

class _MatchScheduleScreenState extends State<MatchScheduleScreen> {
  // Dummy data for upcoming matches
  final List<Map<String, dynamic>> upcomingMatches = const [
    {
      'league': 'Champions League',
      'date': 'Today',
      'time': '08:00 PM',
      'stadium': 'Old Trafford',
      'team1': 'Manchester ',
      'team1_logo': 'assets/england.png', // Placeholder image asset
      'team2': 'Nottingham',
      'team2_logo': 'assets/england.png', // Placeholder image asset
    },
    {
      'league': 'Premier League',
      'date': 'Tomorrow',
      'time': '08:00 PM',
      'stadium': 'Old Trafford',
      'team1': 'Manchester',
      'team1_logo': 'assets/england.png', // Placeholder image asset
      'team2': 'Getale',
      'team2_logo': 'assets/england.png', // Placeholder image asset
    },
    {
      'league': 'Champions League',
      'date': 'Tomorrow',
      'time': '08:00 PM',
      'stadium': 'Old Trafford',
      'team1': 'Manchester',
      'team1_logo': 'assets/england.png', // Placeholder image asset
      'team2': 'FC Barcelona',
      'team2_logo': 'assets/england.png', // Placeholder image asset
    },
  ];

  final List<Map<String, dynamic>> pastMatches = const [
    // Add dummy data for past matches here if needed
  ];

  int _selectedIndex = 0; // 0 for Upcoming, 1 for Past

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> currentMatches = _selectedIndex == 0 ? upcomingMatches : pastMatches;

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
          // Main content area with widgets and individual padding
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // App bar with back button and notification icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
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
                        'Match Schedules',
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
                ),
                const SizedBox(height: 24),
                // Search bar and icon section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search Here..',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: Colors.white54),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF99D43),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Tabs for navigation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _buildTab('Upcoming Matches', 0),
                        _buildTab('Past Matches', 1),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // The main scrollable content area
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: currentMatches.map((match) {
                          return _buildMatchCard(match);
                        }).toList(),
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

  Widget _buildMatchCard(Map<String, dynamic> match) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Team 1
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(match['team1_logo']),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        match['team1'],
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Match info (time, stadium)
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        match['date'],
                        style: const TextStyle(color: Color(0xFFF1C40F), fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        match['time'],
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        match['stadium'],
                        style: const TextStyle(color: Color(0xFFFF6F61), fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Team 2
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(match['team2_logo']),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        match['team2'],
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF205FA2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  match['league'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2E8B57) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
