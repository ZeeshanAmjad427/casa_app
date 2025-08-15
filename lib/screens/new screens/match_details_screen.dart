import 'package:flutter/material.dart';

class MatchDetailsPage extends StatefulWidget {
  const MatchDetailsPage({super.key});

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  // Dummy data for the UI
  final String team1Name = "Arsenal";
  final String team2Name = "Chelsea";
  final String score = "0 - 3";
  final String team1Logo = 'assets/europe.png'; // Placeholder
  final String team2Logo = 'assets/england.png'; // Placeholder
  final String league = "Champions League";
  final String gameWeek = "Game Week 1";
  final String stadium = "Old Trafford";

  final List<Map<String, String>> goalScorers = const [
    {'name': 'Antony', 'time': "32'"},
    {'name': 'Diogo Dalot', 'time': "74'"},
  ];

  final List<Map<String, String>> goals = const [
    {'number': '1', 'player': 'Erling Haaland', 'team': 'Manchester City', 'stat': '02', 'player_photo': 'assets/europe.png'},
    {'number': '2', 'player': 'Harry Kane', 'team': 'Tottenham', 'stat': '01', 'player_photo': 'assets/england.png'},
  ];

  final List<Map<String, String>> assists = const [
    {'number': '1', 'player': 'Ivan Toney', 'team': 'Brentford', 'stat': '02', 'player_photo': 'assets/europe.png'},
    {'number': '2', 'player': 'Mohamad Salah', 'team': 'Liverpool', 'stat': '10', 'player_photo': 'assets/england.png'},
    {'number': '3', 'player': 'Marcus Rashford', 'team': 'Manchester United', 'stat': '06', 'player_photo': 'assets/europe.png'},
  ];

  final List<Map<String, dynamic>> cards = const [
    {'number': '1', 'player': 'Ivan Toney', 'team': 'Brentford', 'card_type': 'yellow', 'player_photo': 'assets/europe.png'},
    {'number': '2', 'player': 'Mohamad Salah', 'team': 'Liverpool', 'card_type': 'yellow', 'player_photo': 'assets/england.png'},
    {'number': '3', 'player': 'Marcus Rashford', 'team': 'Manchester United', 'card_type': 'red', 'player_photo': 'assets/europe.png'},
  ];

  // Added player_photo field to lineup data
  final List<Map<String, String>> lineup = const [
    {'number': '1', 'player_name': 'Erling Haaland', 'jersey': '#10', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
    {'number': '2', 'player_name': 'Alex Williams', 'jersey': '#3', 'position': 'MID', 'starter': 'Yes', 'player_photo': 'assets/england.png'},
    {'number': '3', 'player_name': 'Jason Kim', 'jersey': '#5', 'position': 'MID', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
    {'number': '4', 'player_name': 'Marcus Green', 'jersey': '#9', 'position': 'DEF', 'starter': 'Yes', 'player_photo': 'assets/england.png'},
    {'number': '5', 'player_name': 'Judith Thompson', 'jersey': '#44', 'position': 'DEF', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
    {'number': '6', 'player_name': 'Gabriel Adams', 'jersey': '#2', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/england.png'},
    {'number': '7', 'player_name': 'Tyler Nguyes', 'jersey': '#3', 'position': 'MID', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
    {'number': '8', 'player_name': 'Ellan Robinson', 'jersey': '#6', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/england.png'},
    {'number': '9', 'player_name': 'Ellan Robinson', 'jersey': '#6', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
    {'number': '10', 'player_name': 'Ellan Robinson', 'jersey': '#6', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/england.png'},
    {'number': '11', 'player_name': 'Ellan Robinson', 'jersey': '#6', 'position': 'FWD', 'starter': 'Yes', 'player_photo': 'assets/europe.png'},
  ];

  // Added player_photo field to substitutes data
  final List<Map<String, String>> substitutes = const [
    {'number': '1', 'player_name': 'Julien Reyes', 'jersey': '#10', 'position': 'FWD', 'starter': 'No', 'player_photo': 'assets/europe.png'},
    {'number': '2', 'player_name': 'Alden Brooks', 'jersey': '#12', 'position': 'MID', 'starter': 'No', 'player_photo': 'assets/england.png'},
    {'number': '3', 'player_name': 'Sean Murphy', 'jersey': '#5', 'position': 'GK', 'starter': 'No', 'player_photo': 'assets/europe.png'},
    {'number': '4', 'player_name': 'Xavier Johnson', 'jersey': '#13', 'position': 'DEF', 'starter': 'No', 'player_photo': 'assets/england.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  'assets/casa_logo.png', // Placeholder, please add your own asset
                  height: screenHeight * 0.38,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  // App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                        Text(
                          'Match Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.notifications_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                  // Match Result Card with logo behind score
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Transparent CASA logo behind score
                        Positioned(
                          child: Opacity(
                            opacity: 0.08,
                            child: Image.asset(
                              'assets/casa_logo.png',
                              width: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        _buildMatchResultCard(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TabBar
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C2461),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      indicatorColor: Colors.orange,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      tabs: const [
                        Tab(text: "Stats"),
                        Tab(text: "Lineup"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildStatsContent(),
                        _buildLineupContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchResultCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF9C66B), Color(0xFFE5A642)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            '$league\n$gameWeek',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(team1Logo, height: 50),
                  const SizedBox(height: 4),
                  Text(team1Name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                score,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Image.asset(team2Logo, height: 50),
                  const SizedBox(height: 4),
                  Text(team2Name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(stadium, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Goal Scorer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: goalScorers.map((scorer) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.sports_soccer, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text('${scorer['name']} ${scorer['time']}', style: const TextStyle(color: Colors.white)),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Goals"),
          _buildStatsCard(['#', 'Players', 'Goals'], goals),
          _buildSectionTitle("Assists"),
          _buildStatsCard(['#', 'Players', 'Assists'], assists),
          _buildSectionTitle("Cards"),
          _buildCardsCard(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLineupContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Arsenal"),
          _buildLineupCard(lineup),
          _buildSectionTitle("Substitutes"),
          _buildLineupCard(substitutes),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatsCard(List<String> headers, List<Map<String, String>> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF14457A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: Text(headers[0], style: const TextStyle(color: Colors.white70))),
              Expanded(flex: 5, child: Text(headers[1], style: const TextStyle(color: Colors.white70))),
              Expanded(
                flex: 2,
                child: Text(headers[2], style: const TextStyle(color: Colors.white70), textAlign: TextAlign.right),
              ),
            ],
          ),
          const Divider(color: Colors.white12),
          ...data.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text(item['number']!, style: const TextStyle(color: Colors.white))),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundImage: AssetImage(item['player_photo']!)),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['player']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text(item['team']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(item['stat']!, style: const TextStyle(color: Color(0xFFF9C66B), fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildCardsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF14457A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(flex: 1, child: Text('#', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 5, child: Text('Players', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 2, child: Text('Cards', style: TextStyle(color: Colors.white70), textAlign: TextAlign.right)),
            ],
          ),
          const Divider(color: Colors.white12),
          ...cards.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text(item['number']!, style: const TextStyle(color: Colors.white))),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundImage: AssetImage(item['player_photo']!)),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['player']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text(item['team']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 15,
                        height: 20,
                        color: item['card_type'] == 'yellow' ? Colors.yellow : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Updated _buildLineupCard to include player images
// The rest of the code remains the same...

  Widget _buildLineupCard(List<Map<String, String>> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF14457A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(flex: 1, child: Text('#', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 4, child: Text('Player Name', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 2, child: Text('Jersey #', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 2, child: Text('Position', style: TextStyle(color: Colors.white70))),
              Expanded(flex: 1, child: Text('Starter', style: TextStyle(color: Colors.white70), textAlign: TextAlign.right)),
            ],
          ),
          const Divider(color: Colors.white12),
          ...data.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text(item['number']!, style: const TextStyle(color: Colors.white))),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundImage: AssetImage(item['player_photo']!)),
                        const SizedBox(width: 8),
                        // Use Flexible to prevent text overflow
                        Flexible(
                          child: Text(
                            item['player_name']!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: Text(item['jersey']!, style: const TextStyle(color: Colors.white))),
                  Expanded(flex: 2, child: Text(item['position']!, style: const TextStyle(color: Colors.white))),
                  Expanded(
                    flex: 1,
                    child: Text(
                      item['starter']!,
                      style: TextStyle(
                        color: item['starter'] == 'Yes' ? Colors.white : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }}