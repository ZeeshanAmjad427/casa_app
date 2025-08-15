import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  // Dummy data for the goals list
  final List<Map<String, dynamic>> goalsData = const [
    {
      'rank': 1,
      'player': 'Erling Haaland',
      'team': 'Manchester City',
      'goals': 34,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 2,
      'player': 'Harry Kane',
      'team': 'Tottenham',
      'goals': 26,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 3,
      'player': 'John Smith',
      'team': 'Manchester United',
      'goals': 17,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 4,
      'player': 'James Bond',
      'team': 'Arsenal',
      'goals': 15,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 5,
      'player': 'Jimmy Anderson',
      'team': 'Chelsea',
      'goals': 10,
      'image': 'assets/europe.png', // Placeholder image asset
    },
  ];

  // Dummy data for the assists list
  final List<Map<String, dynamic>> assistsData = const [
    {
      'rank': 1,
      'player': 'Ivan Toney',
      'team': 'Brentford',
      'assists': 10,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 2,
      'player': 'Mohamed Salah',
      'team': 'Liverpool',
      'assists': 8,
      'image': 'assets/europe.png', // Placeholder image asset
    },
    {
      'rank': 3,
      'player': 'Marcus Rashford',
      'team': 'Manchester United',
      'assists': 6,
      'image': 'assets/europe.png', // Placeholder image asset
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
                ),
                const SizedBox(height: 24),
                // League logo and name section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
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
                ),
                const SizedBox(height: 24),
                // Tabs for navigation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTab('Results', false),
                        _buildTab('Fixtures', false),
                        _buildTab('Standings', false),
                        _buildTab('Stats', true), // 'Stats' is now selected
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
                        children: [
                          // Goals section
                          const Text(
                            'Goals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildStatsListCard(goalsData, 'Goals'),
                          const SizedBox(height: 24),
                          // Assists section
                          const Text(
                            'Assists',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildStatsListCard(assistsData, 'Assists'),
                          const SizedBox(height: 24),
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

  Widget _buildStatsListCard(List<Map<String, dynamic>> data, String statType) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headers for the list
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      '#',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Players',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      statType, // "Goals" or "Assists"
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              // Line under the headers
              const SizedBox(height: 8),
              Container(
                height: 1.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              // List of players
              Column(
                children: data.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${item['rank']}',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage(item['image']), // Use the image path
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item['player']}',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Text(
                                    '${item['team']}',
                                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Add the bisector line here
                        Container(
                          width: 1,
                          height: 36, // Adjust the height to match the row
                          color: Colors.white.withOpacity(0.2),
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            // Dynamically get the stat value based on the statType
                            '${statType == 'Goals' ? item['goals'] : item['assists']}',
                            style: const TextStyle(
                              color: Color(0xFFFF6F61),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
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
    );
  }
}
