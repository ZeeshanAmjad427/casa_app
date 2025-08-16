import 'package:flutter/material.dart';

class PlayersStatsScreen extends StatefulWidget {
  const PlayersStatsScreen({super.key});

  @override
  State<PlayersStatsScreen> createState() => _PlayersStatsScreenState();
}

class _PlayersStatsScreenState extends State<PlayersStatsScreen> {
  final List<String> tabs = ['Players Stats', 'Fixtures', 'Results'];
  String _selectedTab = 'Players Stats';

  // Dummy data for player stats
  final List<Map<String, dynamic>> playersData = const [
    {'rank': 1, 'name': 'Michael Ste...', 'jerseyNumber': 15, 'position': 'MID', 'goals': 6, 'assists': 4, 'mvps': 40},
    {'rank': 2, 'name': 'Ryan Bennett', 'jerseyNumber': 6, 'position': 'FWD', 'goals': 4, 'assists': 4, 'mvps': 53},
    {'rank': 3, 'name': 'Leo Morgan', 'jerseyNumber': 8, 'position': 'DEF', 'goals': 11, 'assists': 4, 'mvps': 29},
    {'rank': 4, 'name': 'Oliver Wood', 'jerseyNumber': 14, 'position': 'GK', 'goals': 5, 'assists': 7, 'mvps': 9},
    {'rank': 5, 'name': 'Jack Thompson', 'jerseyNumber': 7, 'position': 'DEF', 'goals': 6, 'assists': 11, 'mvps': 5},
    {'rank': 6, 'name': 'Mason Price', 'jerseyNumber': 1, 'position': 'MID', 'goals': 8, 'assists': 9, 'mvps': 22},
    {'rank': 7, 'name': 'Tottenham', 'jerseyNumber': 9, 'position': 'FWD', 'goals': 5, 'assists': 11, 'mvps': 7},
    {'rank': 8, 'name': 'Benjamin Rose', 'jerseyNumber': 5, 'position': 'SUB', 'goals': 7, 'assists': 9, 'mvps': 15},
    {'rank': 9, 'name': 'Noah Davies', 'jerseyNumber': 3, 'position': 'GK', 'goals': 14, 'assists': 8, 'mvps': 7},
    {'rank': 10, 'name': 'Samuel Patel', 'jerseyNumber': 4, 'position': 'DEF', 'goals': 6, 'assists': 13, 'mvps': 1},
    {'rank': 11, 'name': 'Dylan Hughes', 'jerseyNumber': 2, 'position': 'MID', 'goals': 9, 'assists': 13, 'mvps': -5},
    {'rank': 12, 'name': 'James Sullivan', 'jerseyNumber': 11, 'position': 'SUB', 'goals': 10, 'assists': 14, 'mvps': -11},
    {'rank': 13, 'name': 'Ethan Clarke', 'jerseyNumber': 12, 'position': 'FWD', 'goals': 5, 'assists': 20, 'mvps': -13},
    {'rank': 14, 'name': 'Oliver Wood', 'jerseyNumber': 13, 'position': 'FWD', 'goals': 10, 'assists': 16, 'mvps': -22},
    {'rank': 15, 'name': 'Mason Price', 'jerseyNumber': 10, 'position': 'MID', 'goals': 6, 'assists': 20, 'mvps': -29},
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
                            color:  Color(0xFFF1C40F),
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
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 24,
                          child: Text(
                            '#',
                            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(flex: 3, child: Text('Players', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 40,
                            child: Text('J#', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                        SizedBox(
                            width: 40,
                            child: Text('Pos', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                        Expanded(child: Text('Goals', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0), textAlign: TextAlign.center)),
                        Expanded(child: Text('Assist', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0), textAlign: TextAlign.center)),
                        Expanded(child: Text('MVPs', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0), textAlign: TextAlign.center)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rows
                  Expanded(
                    child: ListView.builder(
                      itemCount: playersData.length,
                      itemBuilder: (context, index) {
                        final player = playersData[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF135398),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Text(
                                  '${player['rank']}',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  player['name'],
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  width: 40,
                                  child: Text('${player['jerseyNumber']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                              SizedBox(
                                  width: 40,
                                  child: Text('${player['position']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                              Expanded(child: Text('${player['goals']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                              Expanded(child: Text('${player['assists']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                              Expanded(child: Text('${player['mvps']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            ],
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
