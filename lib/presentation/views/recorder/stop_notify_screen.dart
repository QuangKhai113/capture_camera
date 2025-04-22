import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io'; // Import to handle the video file
import '../loading/loading_screen.dart';
import '../video/video_preview_screen.dart';


class StopNotifyScreen extends StatelessWidget {
  final File videoFile;
  final List<CameraDescription> cameras;
  final CameraController cameraController;

  const StopNotifyScreen({
    super.key,
    required this.videoFile,
    required this.cameras,
    required this.cameraController,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.5, // Chiếm 50% màn hình
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/Icon.svg',
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Complete the Video\n Recording',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Intel',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00294D),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Confirm your use of this video to create your \nimmersive 360 tour.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF00284B),
                    ),
                  ),
                  Spacer(), // đẩy nút xuống đáy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 179, // 👈 chiều ngang mong muốn
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPreviewScreen(
                                  videoFile: videoFile,
                                  cameras: cameras, // Thêm cameras
                                  cameraController: cameraController, // Thêm cameraController
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Preview',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xFF00284B),
                            side: BorderSide(color: Color(0xFF00284B), width: 2),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 185, // 👈 chỉnh số này để điều chỉnh độ dài nút
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to LoadingScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingScreen(videoFile: videoFile),
                              ),
                            );
                          },
                          child: Text(
                            'Confirm to Use',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00284B),
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}