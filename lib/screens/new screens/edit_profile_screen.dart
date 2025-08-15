import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers for the text input fields
  final TextEditingController _firstNameController = TextEditingController(text: 'Michael');
  final TextEditingController _lastNameController = TextEditingController(text: 'Stephaine');
  final TextEditingController _dobController = TextEditingController(text: '20th May, 2001');
  final TextEditingController _ageController = TextEditingController(text: '22');
  final TextEditingController _emailController = TextEditingController(text: 'michaelstephaine123@gmail.com');
  final TextEditingController _contactController = TextEditingController(text: '+102-02345-1213');
  final TextEditingController _addressController = TextEditingController(text: 'Street 14, US New York City');
  final TextEditingController _passwordController = TextEditingController(text: '********');

  String? _selectedGender = 'Male';
  bool _isPasswordVisible = false;

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
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
                        onPressed: () {
                          // TODO: Implement navigation back
                          Navigator.of(context).pop();
                        },
                      ),
                      const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.notifications_outlined, color: Colors.white, size: 28),
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
                              margin: const EdgeInsets.only(top: 50),
                              padding: const EdgeInsets.only(top: 90.0, bottom: 20.0, left: 16.0, right: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF2E65A4),
                                    Color(0xFF13366C),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // First Name Input Field
                                  _buildCustomTextField(
                                    label: 'First Name',
                                    controller: _firstNameController,
                                    icon: Icons.person_outline,
                                  ),
                                  const SizedBox(height: 20),
                                  // Last Name Input Field
                                  _buildCustomTextField(
                                    label: 'Last Name',
                                    controller: _lastNameController,
                                    icon: Icons.person_outline,
                                  ),
                                  const SizedBox(height: 20),
                                  // Gender Dropdown
                                  _buildGenderDropdown(),
                                  const SizedBox(height: 20),
                                  // Date of Birth Input Field
                                  _buildCustomTextField(
                                    label: 'Date of Birth',
                                    controller: _dobController,
                                    icon: Icons.calendar_today,
                                    readOnly: true,
                                    onTap: () async {
                                      // TODO: Implement date picker
                                      print('Date picker tapped');
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  // Age Input Field
                                  _buildCustomTextField(
                                    label: 'Age',
                                    controller: _ageController,
                                    icon: Icons.people_outline,
                                  ),
                                  const SizedBox(height: 20),
                                  // Email Input Field
                                  _buildCustomTextField(
                                    label: 'Email',
                                    controller: _emailController,
                                    icon: Icons.email_outlined,
                                  ),
                                  const SizedBox(height: 20),
                                  // Contact Number Input Field
                                  _buildCustomTextField(
                                    label: 'Contact No.',
                                    controller: _contactController,
                                    icon: Icons.phone_outlined,
                                  ),
                                  const SizedBox(height: 20),
                                  // Address Input Field
                                  _buildCustomTextField(
                                    label: 'Address',
                                    controller: _addressController,
                                    icon: Icons.location_on_outlined,
                                  ),
                                  const SizedBox(height: 20),
                                  // Password Input Field
                                  _buildCustomPasswordTextField(),
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
                                  border: Border.all(color: const Color(0xFF0C2461), width: 2),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.yellow, width: 4),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage('assets/images/person.png'), // Placeholder
                                  ),
                                ),
                              ),
                            ),
                            // Edit icon on profile picture, now at top-left
                            Positioned(
                              top: 10,
                              left: (screenWidth / 2) + 10, // Center of screen minus half of container width
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, color: Color(0xFF0C2461), size: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement save functionality here
                              print('Saving changes');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
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

  // A reusable helper widget for text input fields with a top-left label
  Widget _buildCustomTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        floatingLabelStyle: const TextStyle(color: Colors.white, fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.white, size: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  // Helper for the gender dropdown with a top-left label
  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      dropdownColor: const Color(0xFF13366C),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Gender',
        labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        floatingLabelStyle: const TextStyle(color: Colors.white, fontSize: 16),
        prefixIcon: const Icon(Icons.male, color: Colors.white, size: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue;
        });
      },
      items: <String>['Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 16)),
        );
      }).toList(),
    );
  }

  // Helper for the password text field with a visibility toggle and a top-left label
  Widget _buildCustomPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        floatingLabelStyle: const TextStyle(color: Colors.white, fontSize: 16),
        prefixIcon: const Icon(Icons.vpn_key_outlined, color: Colors.white, size: 24),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
