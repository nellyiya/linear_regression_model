import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConnectScreen(),
    );
  }
}

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5, // Keep the top section height
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/connect_image.png', // Updated asset image
                      height: 250,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5, // Keep the bottom section height
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        height: double.infinity,
                        color: Color(0xFF1B1D3A), // Dark navy background
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ), // Adjusted vertical padding
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "🫀 Heart Attack Risk Prediction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Assess your heart health instantly . Stay informed, stay healthy!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 25),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "🔍 Check Your Risk Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(
      0,
      size.height * 0.10,
    ); // Adjusted wave height to start even higher
    path.quadraticBezierTo(
      size.width / 4,
      size.height * 0.30,
      size.width / 2,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height * 0.20,
      size.width,
      size.height * 0.30,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
