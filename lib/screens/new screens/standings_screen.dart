import 'package:flutter/material.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  // Make sure you add this image to pubspec:
  // assets:
  //   - assets/casa_logo.png
  //   - assets/europe.png

  final List<Map<String, dynamic>> standingsData = const [
    {'rank': 1, 'team': 'Arsenal', 'pl': 33, 'w': 23, 'd': 6, 'l': 4, 'gd': 40, 'pts': 75, 'status': 'qualify'},
    {'rank': 2, 'team': 'Manchester City', 'pl': 31, 'w': 23, 'd': 4, 'l': 4, 'gd': 53, 'pts': 73, 'status': 'qualify'},
    {'rank': 3, 'team': 'Newcastle Uni.', 'pl': 31, 'w': 16, 'd': 11, 'l': 4, 'gd': 29, 'pts': 59, 'status': 'qualify'},
    {'rank': 4, 'team': 'Manchester Uni.', 'pl': 30, 'w': 18, 'd': 5, 'l': 7, 'gd': 9, 'pts': 59, 'status': 'play_offs'},
    {'rank': 5, 'team': 'Aston Villa', 'pl': 33, 'w': 16, 'd': 6, 'l': 11, 'gd': 5, 'pts': 54, 'status': 'play_offs'},
    {'rank': 6, 'team': 'Liverpool', 'pl': 32, 'w': 15, 'd': 8, 'l': 9, 'gd': 22, 'pts': 53, 'status': 'play_offs'},
    {'rank': 7, 'team': 'Tottenham', 'pl': 32, 'w': 16, 'd': 5, 'l': 11, 'gd': 7, 'pts': 53, 'status': ''},
    {'rank': 8, 'team': 'Brighton', 'pl': 30, 'w': 14, 'd': 7, 'l': 9, 'gd': 15, 'pts': 49, 'status': ''},
    {'rank': 9, 'team': 'Brentford', 'pl': 33, 'w': 11, 'd': 14, 'l': 8, 'gd': 7, 'pts': 47, 'status': ''},
    {'rank': 10, 'team': 'Fulham', 'pl': 32, 'w': 13, 'd': 6, 'l': 13, 'gd': 1, 'pts': 45, 'status': ''},
    {'rank': 11, 'team': 'Chelsea', 'pl': 32, 'w': 10, 'd': 9, 'l': 13, 'gd': -5, 'pts': 39, 'status': ''},
    {'rank': 12, 'team': 'Crystal Palace', 'pl': 33, 'w': 9, 'd': 10, 'l': 14, 'gd': -11, 'pts': 37, 'status': ''},
    {'rank': 13, 'team': 'Leicester City', 'pl': 33, 'w': 8, 'd': 5, 'l': 20, 'gd': -29, 'pts': 29, 'status': 'eliminate'},
    {'rank': 14, 'team': 'Everton', 'pl': 32, 'w': 6, 'd': 10, 'l': 16, 'gd': -22, 'pts': 28, 'status': 'eliminate'},
    {'rank': 15, 'team': 'Southampton', 'pl': 32, 'w': 6, 'd': 6, 'l': 20, 'gd': -29, 'pts': 24, 'status': 'eliminate'},
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0A3767),
      body: Stack(
        children: [
          // Watermark image at top-right (behind everything)
          Positioned(
            top: -w * 0.18,
            right: -w * 0.30,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.08,
                child: Image.asset(
                  'assets/casa_logo.png',      // <- your decorative image
                  height: h * 0.38,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Foreground content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // App bar row (will appear above the watermark)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
                      const Text(
                        'league',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // Slight frosted look like the mock
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.notifications_none_outlined, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // League name
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26,
                      child: Image.asset('assets/europe.png'),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Champions League',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _tab('Results', false),
                    _tab('Fixtures', false),
                    _tab('Standings', true),
                    _tab('Stats', false),
                  ],
                ),
                const SizedBox(height: 20),

                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(width: 24),
                      Expanded(flex: 4, child: Text('Teams', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      Expanded(child: Text('PL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      Expanded(child: Text('W', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      Expanded(child: Text('D', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      Expanded(child: Text('L', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      Expanded(child: Text('GD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      Expanded(child: Text('PTS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Rows
                Expanded(
                  child: ListView.builder(
                    itemCount: standingsData.length + 1,
                    itemBuilder: (context, index) {
                      if (index == standingsData.length) return _legend();

                      final team = standingsData[index];

                      // (You can keep this as in your mock; using same bg for all rows)
                      final bgColor = const Color(0xFF135398);

                      final lineColor = _lineColorForIndex(index, standingsData.length);

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              child: Text(
                                '${team['rank']}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  // vertical indicator
                                  Container(
                                    width: 3,
                                    height: 32,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: lineColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.shield_outlined, color: Colors.blue, size: 16),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      team['team'],
                                      style: const TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Text('${team['pl']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            Expanded(child: Text('${team['w']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            Expanded(child: Text('${team['d']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            Expanded(child: Text('${team['l']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            Expanded(child: Text('${team['gd']}', style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                            Expanded(
                              child: Text(
                                '${team['pts']}',
                                style: const TextStyle(color: Color(0xFFFF6F61), fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // gold = top 3, orange = next 3, red = bottom 3
  Color _lineColorForIndex(int index, int length) {
    if (index <= 2) return const Color(0xFFF1C40F);
    if (index >= 3 && index <= 5) return const Color(0xFFF99D43);
    if (index >= length - 3) return const Color(0xFFC0392B);
    return Colors.transparent;
  }

  Widget _tab(String title, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.white54,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (selected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFFF6F61), Color(0xFFF99D43)]),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _legend() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _legendRow(const Color(0xFFF1C40F), 'Qualify'),
          const SizedBox(height: 6),
          _legendRow(const Color(0xFFF99D43), 'Play offs'),
          const SizedBox(height: 6),
          _legendRow(const Color(0xFFC0392B), 'Eliminate'),
        ],
      ),
    );
  }

  Widget _legendRow(Color color, String text) {
    return Row(
      children: [
        Container(width: 14, height: 14, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
