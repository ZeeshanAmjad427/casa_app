import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:track_and_trace/screens/analytics_screen.dart';
import 'package:track_and_trace/screens/dashboard_screen.dart';
import 'package:track_and_trace/screens/new%20screens/league_details_screen.dart';
import 'package:track_and_trace/screens/new%20screens/league_fixtures_screen.dart';
import 'package:track_and_trace/screens/new%20screens/leagues_screen.dart';
import 'package:track_and_trace/screens/new%20screens/login_screen.dart';
import 'package:track_and_trace/screens/new%20screens/match_details_screen.dart';
import 'package:track_and_trace/screens/new%20screens/match_invite_request_screen.dart';
import 'package:track_and_trace/screens/new%20screens/match_schedule_screen.dart';
import 'package:track_and_trace/screens/new%20screens/onboarding_screen.dart';
import 'package:track_and_trace/screens/new%20screens/past_match_scedule_screen.dart';
import 'package:track_and_trace/screens/new%20screens/standings_screen.dart';
import 'package:track_and_trace/screens/new%20screens/stats_screen.dart';
import 'package:track_and_trace/screens/production_order_detail_screen.dart';
import 'package:track_and_trace/screens/production_order_screen.dart';
import 'package:track_and_trace/screens/new%20screens/role_selection_team.dart';
import 'package:track_and_trace/screens/new%20screens/sign_waiver_agreement_screen.dart';
import 'package:track_and_trace/screens/new%20screens/splash_screen.dart';
import 'package:track_and_trace/screens/new%20screens/upload_profile_picture_screen.dart';
import 'package:track_and_trace/screens/users_screen.dart';
import 'package:track_and_trace/screens/new%20screens/verify_yourself_screen.dart';

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
      home: const MatchInviteRequestPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}