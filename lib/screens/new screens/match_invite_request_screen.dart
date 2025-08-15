import 'package:flutter/material.dart';

class MatchInviteRequestPage extends StatelessWidget {
  const MatchInviteRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive positioning
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dummy data to simulate multiple invites
    final List<Map<String, String>> invites = [
      {
        'inviter': 'Jack Thompson',
        'matchDate': 'May 20, 2025',
        'teamName': 'Manchester City',
        'venue': 'Old Trafford',
        'profilePhoto': 'assets/england.png',
        'teamLogo': 'assets/images/man_city_logo.png', // Placeholder
      },
      {
        'inviter': 'Jack Thompson',
        'matchDate': 'May 20, 2025',
        'teamName': 'Manchester City',
        'venue': 'Old Trafford',
        'profilePhoto': 'assets/europe.png',
        'teamLogo': 'assets/images/man_city_logo.png', // Placeholder
      },
      {
        'inviter': 'Jack Thompson',
        'matchDate': 'May 20, 2025',
        'teamName': 'Manchester City',
        'venue': 'Old Trafford',
        'profilePhoto': 'assets/england.png',
        'teamLogo': 'assets/images/man_city_logo.png', // Placeholder
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0C2461),
      body: Stack(
        children: [
          // Top Right Background Image
          Positioned(
            top: -screenHeight * 0.1,
            right: -screenWidth * 0.2,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/casa_logo.png',
                height: screenHeight * 0.5,
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
                      const Icon(Icons.arrow_back_ios, color: Colors.white),
                      const Text(
                        'Match Invite Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        children: [
                          const Icon(Icons.notifications_outlined, color: Colors.white, size: 28),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: invites.length,
                    itemBuilder: (context, index) {
                      final invite = invites[index];
                      return _buildInviteCard(
                        inviter: invite['inviter']!,
                        matchDate: invite['matchDate']!,
                        teamName: invite['teamName']!,
                        venue: invite['venue']!,
                        profilePhoto: invite['profilePhoto']!,
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

  Widget _buildInviteCard({
    required String inviter,
    required String matchDate,
    required String teamName,
    required String venue,
    required String profilePhoto,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF14457A),
            const Color(0xFF0C2461),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(profilePhoto),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$inviter invited you.',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Jack Thompson invited you to join the team for the upcoming match.',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(Icons.calendar_today, 'Match Date', matchDate),
              _buildInfoColumn(Icons.sports_soccer, 'Team', teamName),
              _buildInfoColumn(Icons.location_on, 'Venue', venue),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    ),
                    child: const FittedBox(
                      child: Text('Accept', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    ),
                    child: const FittedBox(
                      child: Text('Reject', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}