import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String _selectedRole = 'Player'; // Initial selected role

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0A3767),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background player image (transparent)
          Opacity(
            opacity: 0.05,
            child: Image.asset(
              'assets/role_player.png',
              fit: BoxFit.fitHeight,
              height: screenHeight,
            ),
          ),

          // Background football logo (transparent)
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/football.png',
                height: screenHeight * 0.2,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // CASA logo
          Positioned(
            top: screenHeight * 0.13,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/casa_logo.png',
              height: screenHeight * 0.2,
              fit: BoxFit.contain,
            ),
          ),

          // All foreground widgets (text, role selectors, button)
          Positioned(
            top: screenHeight * 0.37,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SELECT YOUR ROLE',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Are you a Player or a Manager?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),

                // Role selection circles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRoleCircle(
                      context,
                      role: 'Player',
                      imageAsset: 'assets/player_img.png',
                      label: 'Player',
                    ),
                    _buildRoleCircle(
                      context,
                      role: 'Manager',
                      imageAsset: 'assets/manager_img.png',
                      label: 'Manager',
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),

          // Continue button
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E8B57),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a single role selection circle with borders and checkmark
  Widget _buildRoleCircle(
      BuildContext context, {
        required String role,
        required String imageAsset,
        required String label,
      }) {
    bool isSelected = _selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer container for the border
              Container(
                width: 130, // Increased size
                height: 130, // Increased size
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? const Color(0xFFE5B80B) : Colors.white24,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipOval(
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Yellow checkmark for the selected role
              if (isSelected)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5B80B),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFE5B80B) : Colors.white54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}