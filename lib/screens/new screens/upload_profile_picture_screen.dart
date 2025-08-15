import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadProfilePictureScreen extends StatelessWidget {
  const UploadProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A3767),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        // Handle close action
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Upload Profile Picture',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF142E46),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'We recommend taking a selfie to meet all the photo guidelines easily.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [6, 4],
                    color: Color(0xFF0A3767),
                    strokeWidth: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image_outlined,
                            size: 40,
                            color: Color(0xFF142E46),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Upload Your Profile Picture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A3767),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Select a photo from your gallery or take a new one to complete your profile.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Handle browse image logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E8B57),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Text(
                                'Browse Image',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      // The container with the solid border and text
                      Container(
                        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF0A3767), width: 1.5),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center, // Aligns text and icon in the center
                          children: [
                            Text(
                              'Instructions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• Use a clear, high-quality photo (no blurs or filters)\n\n'
                                  '• Face forward - your face should be fully visible and looking at the camera\n\n'
                                  '• Use a neutral or plain background - avoid cluttered or distracting backgrounds\n\n'
                                  '• Good lighting - make sure your face is well lit (natural light is best)\n\n'
                                  '• No sunglasses, hats, or masks - your full face should be visible\n\n'
                                  '• Use a recent photo (taken within the last year)',
                              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Color(0xFF0A3767)),
                            ),
                          ],
                        ),
                      ),
                      // The bulb icon positioned on the top border
                      Positioned(
                        top: -15,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                            // border: Border.all(color: Colors.grey.shade400, width: 1.5),
                          ),
                          child: const Icon(
                            Icons.wb_incandescent_outlined,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}