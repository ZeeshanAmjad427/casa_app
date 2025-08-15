import 'package:flutter/material.dart';

class SignWaiverAgreementScreen extends StatefulWidget {
  const SignWaiverAgreementScreen({super.key});

  @override
  State<SignWaiverAgreementScreen> createState() => _SignWaiverAgreementScreenState();
}

class _SignWaiverAgreementScreenState extends State<SignWaiverAgreementScreen> {
  bool _isAgreed = false; // State to manage the checkbox
  bool _isScrolledToBottom = false; // State to track if the user has scrolled to the bottom
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // Check if the user has scrolled to the very end of the content
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels > 0) {
          // The user is at the bottom of the list
          if (!_isScrolledToBottom) {
            setState(() {
              _isScrolledToBottom = true;
            });
          }
        }
      } else {
        // The user has scrolled back up
        if (_isScrolledToBottom) {
          setState(() {
            _isScrolledToBottom = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0A3767),
      body: Stack(
        children: [
          // Top-right background image
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

          // Main content is a single scrollable view that contains everything
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'Sign Waiver Agreement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16), // Spacer
                    // The main card container which now takes more vertical space
                    // as it is the primary content in the scrollable view
                    Container(
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Waiver Agreement',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'I, and those I have been granted expressed consent to enroll ("Participants"), agree to indemnify and hold harmless the Casa Soccer League ("Casa") its agents and representatives, and the owner of the playing fields used by Casa for any injury incurred during any Casa play and events. Participants understand and agree that Casa reserves the right to eject any player from play. Participants confirm they are over 18 years of age as of the start of the season. Participants recognize and acknowledge that there are certain risks of physical injury and/or sickness and agree to assume the full risk of any injuries, including death, damages, or loss which participants may sustain as a result of engaging in any and all activities connected with or associated with such programs. Participants agree to waive and relinquish all claims as a result of participating in the program against Casa and its Board members, agents, servants, and employees. Participants do hereby fully release and discharge Casa and its Board members, agents, servants and employees from any and all claims from injuries, including death, damage, or loss which the Participants may have or which may accrue on account of participation in the program. Participants further agree to indemnify and hold harmless and defend Casa and its Board members, agents, servants, and employees from any and all claims resulting from injuries, including death, damages, and losses sustained and arising out of, connected with, or in any way associated with the activities of the program. Participants further understand and agree that Casa reserves the right to discontinue any player\'s membership in Casa at any time and without compensation for any fees or dues paid by that player. Participants understand and agree that Casa reserves the right to amend or alter game schedules at any time, and that canceled games may not be rescheduled. Participants have read through, understand, and agree with both the CASA By-Laws and CASA League Rules for their division.\n\n'
                                  'AUDIO / VIDEO AGREEMENT\n'
                                  'Participants hereby irrevocably grant to Casa Soccer League (”CASA”) and its affiliates, agents and representatives the unrestricted right to photograph/record/video/film themselves, and the unrestricted, absolute, perpetual right to use such photographs/images/films/video/text/personal details and derivatives thereof, in all forms of media, for any promotional purposes, including in organizational brochures, direct mail pieces, online, and other print or digital advertising materials. I understand that “photograph” herein encompasses visual images and likenesses such as still photographs, audio recording, and video footage, and recordings.\n\n'
                                  'I hereby release CASA, their associates, affiliates, transferees, appointed advertising agencies, mail vendors, and designated directors, officers, agents, employees, and vendors from any claims, and release and hold them harmless from any reasonable expectation of privacy or confidentiality for myself. I also hereby grant CASA the absolute right and permission to publish, copyright, and use photographs/images/video/text of or about myself for non-commercial promotional purposes.\n\n'
                                  'I further acknowledge my participation is voluntary and that I do not expect or will receive financial compensation of any type associated with the taking or publication of these photographs and images or participation in associated promotional materials.\n\n'
                                  'If the person photographed or videotaped is under 18, I certify that I am his or her parent or legal guardian and I give my consent without reservation to the foregoing on his or her behalf.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), // Spacer
                    // The checkbox and button now appear at the bottom of the scrollable content
                    AnimatedOpacity(
                      opacity: _isScrolledToBottom ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: IgnorePointer(
                        ignoring: !_isScrolledToBottom,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isAgreed,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isAgreed = newValue ?? false;
                                    });
                                  },
                                  activeColor: const Color(0xFF2E8B57),
                                  checkColor: Colors.white,
                                  side: const BorderSide(color: Colors.white54),
                                ),
                                const Flexible(
                                  child: Text(
                                    'I have read and agree to the terms of the waiver agreement.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16), // Spacer
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _isAgreed ? () {
                                  // Handle continue logic
                                } : null,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
