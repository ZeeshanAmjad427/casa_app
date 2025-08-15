import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C2461),
      body: Stack(
        children: [
          // Top Right Background Image
          Positioned(
            top: -MediaQuery.of(context).size.width * 0.2,
            right: -MediaQuery.of(context).size.width * 0.3,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/casa_logo.png', // Placeholder
                height: MediaQuery.of(context).size.height * 0.38,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios, color: Colors.white),
                      const Text(
                        'Notifications',
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
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      _buildNotificationSection('Today', [
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.notifications,
                          mainIconColor: Colors.yellow,
                          secondaryIcon: Icons.warning_amber,
                          title: 'Game Reminder:',
                          message: "Don't forget! Team A vs Team B kicks off today at 4:00 PM. Check in now!",
                          time: '8:00 AM',
                          showIndicator: true,
                        ),
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.search,
                          mainIconColor: Colors.white,
                          secondaryIcon: Icons.add_circle_outline,
                          title: 'New Match Added:',
                          message: "A new game has been added to your schedule. Tap to RSVP!",
                          time: '10:00 AM',
                          showIndicator: true,
                        ),
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.emoji_events,
                          mainIconColor: Colors.white,
                          secondaryIcon: Icons.star,
                          title: 'Standings Updated:',
                          message: "Your team is now 2nd in the league! View full stats.",
                          time: '2:00 PM',
                          showIndicator: true,
                        ),
                      ]),
                      _buildNotificationSection('Yesterday', [
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.add_task,
                          mainIconColor: Colors.red,
                          secondaryIcon: Icons.local_fire_department,
                          title: 'Top Scorer Alert:',
                          message: "You're leading with 6 goals this season! Keep it up!",
                          time: '8:00 AM',
                        ),
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.group,
                          mainIconColor: Colors.white,
                          secondaryIcon: Icons.people_outline,
                          title: 'Team Invite:',
                          message: "FC Barcelona has invited you to join the team. Accept or Reject the invite.",
                          time: '10:00 AM',
                        ),
                        _buildNotificationCard(
                          context,
                          mainIcon: Icons.warning_amber,
                          mainIconColor: Colors.yellow,
                          secondaryIcon: Icons.person_remove,
                          title: 'Player Status:',
                          message: "You've been marked inactive by your manager. Contact them for reactivation.",
                          time: '10:00 AM',
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to build a notification section with a heading
Widget _buildNotificationSection(String title, List<Widget> cards) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ...cards,
    ],
  );
}

// Helper function to build a single notification card
Widget _buildNotificationCard(
    BuildContext context, {
      required IconData mainIcon,
      required Color mainIconColor,
      required IconData secondaryIcon,
      required String title,
      required String message,
      required String time,
      bool showIndicator = false,
    }) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      // Apply linear gradient
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF2E65A4),
          const Color(0xFF13366C),
        ],
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Icon Container
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(mainIcon, color: mainIconColor, size: 24),
        ),
        const SizedBox(width: 12),
        // Notification Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Secondary icon moved to the left
                  Icon(
                    secondaryIcon,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        // Right arrow icon and indicator dot
        Row(
          children: [
            if (showIndicator)
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ],
    ),
  );
}