import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // A function to show the logout confirmation modal dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Background image for the modal
              Positioned(
                bottom: -30,
                right: -30,
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/casa_logo.png', // Placeholder
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Logging Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C2461),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Are you sure you want to Logout of your account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform the logout action here
                              Navigator.of(context).pop(); // Close dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0C2461),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Yes'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.red,
                          width: 4
                      )
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.logout,
                      color:Color(0xFF0C2461),
                      size: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // A function to show the delete account confirmation modal dialog
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Background image for the modal
              Positioned(
                bottom: -30,
                right: -30,
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/casa_logo.png', // Placeholder
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Delete Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C2461),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Are you sure you want to delete your account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform the delete account action here
                              Navigator.of(context).pop(); // Close dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0C2461),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Yes, Delete'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xFF0C2461),
                          width: 4
                      )
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive positioning
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                'assets/casa_logo.png', // Placeholder
                height: screenHeight * 0.38,
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
                      const Icon(Icons.menu, color: Colors.white, size: 28),
                      const Text(
                        'Profile',
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
                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        // Profile Information Card
                        Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: double.infinity,
                              height: screenHeight *0.6,
                              margin: const EdgeInsets.only(top: 50),
                              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF2E65A4),
                                    Color(0xFF13366C),
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 40), // Spacer for profile picture
                                  // Name
                                  const Text(
                                    'Michael Stephaine',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Email
                                  const Text(
                                    'michaelstephaine123@gmail.com',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  // Menu Items
                                  _buildProfileMenuItem(
                                    icon: Icons.person_outline,
                                    title: 'Edit Profile',
                                  ),
                                  const Divider(color: Colors.white24, thickness: 1),
                                  _buildProfileMenuItem(
                                    icon: Icons.gavel_outlined,
                                    title: 'Term of Service',
                                  ),
                                  const Divider(color: Colors.white24, thickness: 1),
                                  _buildProfileMenuItem(
                                    icon: Icons.privacy_tip_outlined,
                                    title: 'Privacy Policy',
                                  ),
                                  const Divider(color: Colors.white24, thickness: 1),
                                  GestureDetector(
                                    onTap: () {
                                      _showDeleteConfirmationDialog(context);
                                    },
                                    child: _buildProfileMenuItem(
                                      icon: Icons.delete_forever_outlined,
                                      title: 'Delete Account',
                                      textColor: Colors.red,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Sync Status Container - now inside the main card
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.sync_outlined, color: Colors.white, size: 18),
                                      const SizedBox(width: 8),
                                      RichText(
                                        text: const TextSpan(
                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                          children: [
                                            TextSpan(text: 'Your profile is synced with '),
                                            TextSpan(
                                              text: 'Sports Engine',
                                              style: TextStyle(
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Profile Picture positioned at the top of the card
                            Positioned(
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF0C2461),
                                  border: Border.all(color: Color(0xFF0C2461), width: 4),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.yellow, width: 4),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/images/person.png'), // Placeholder
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // The spacing at the bottom of the scroll view
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                // Logout Button (positioned at the bottom)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showLogoutConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  // A reusable helper widget for profile menu items
  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    Color textColor = Colors.white,
  }) {
    // Determine the arrow color.
    final arrowColor = textColor == Colors.red ? Colors.red : Colors.yellow;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: arrowColor, size: 16),
        ],
      ),
    );
  }
}
