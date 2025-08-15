import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:track_and_trace/screens/new%20screens/edit_profile_screen.dart';
import 'package:track_and_trace/screens/new%20screens/profile_screen.dart';
import 'package:track_and_trace/screens/new%20screens/team_invite_request_screen.dart';
import 'package:track_and_trace/screens/new%20screens/terms_of_services_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // Set Poppins as the default font for the entire app
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}