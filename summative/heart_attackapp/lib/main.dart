import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ConnectScreen(),
    );
  }
}

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/connect_image.png',
                      height: 250,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error_outline, size: 100),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: const Color(0xFF1B1D3A),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "🫀 Heart Attack Risk Prediction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Assess your heart health instantly. Stay informed, stay healthy!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PredictionScreen()),
                              );
                            },
                            child: const Row(
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

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  String _diabetesValue = '0'; // Default to '0' (No)
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _systolicController = TextEditingController();
  TextEditingController _diastolicController = TextEditingController();
  TextEditingController _cholesterolController = TextEditingController();
  TextEditingController _heartRateController = TextEditingController();

  bool _isLoading = false;
  String? _predictionResult;

  // Function to make the HTTP request to the backend
  Future<void> _predictHeartRisk() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Collect the data from the form
        var url = Uri.parse('https://linear-regression-model-summative-fkb9.onrender.com/predict');
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'AGE': _ageController.text,
            'SYSTOLIC': _systolicController.text,
            'DIASTOLIC': _diastolicController.text,
            'CHOLESTEROL': _cholesterolController.text,
            'HEART_RATE': _heartRateController.text,
            'DIABETES': _diabetesValue,
          }),
        );

        if (response.statusCode == 200) {
          // Parse the response
          var data = json.decode(response.body);
          setState(() {
            _predictionResult = data['prediction'] == '1'
                ? 'High Risk'
                : 'Low Risk';
            _isLoading = false;
          });
        } else {
          throw Exception('Failed to predict');
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _predictionResult = 'Error: Could not calculate risk';
        });
        print(e.toString());  // Debug: printing error to console
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Heart Health Assessment",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1D3A),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Please provide your health information",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: const Color(0xFF1B1D3A),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            _buildInputField("Age", "Years", _ageController),
                            _buildInputField("Systolic BP", "mmHg", _systolicController),
                            _buildInputField("Diastolic BP", "mmHg", _diastolicController),
                            _buildInputField("Cholesterol", "mg/dL", _cholesterolController),
                            _buildInputField("Heart Rate", "bpm", _heartRateController),
                            _buildDiabetesDropdown(),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: _isLoading ? null : _predictHeartRisk,
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Calculate Risk",
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                            ),
                            if (_predictionResult != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Prediction Result: $_predictionResult',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
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
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 16),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDiabetesDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: _diabetesValue,
        decoration: InputDecoration(
          labelText: "Diabetes",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        items: ['No', 'Yes']
            .map((value) => DropdownMenuItem(
                  value: value == 'Yes' ? '1' : '0', // Set 1 for Yes, 0 for No
                  child: Text(value),
                ))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            _diabetesValue = newValue!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select diabetes status';
          }
          return null;
        },
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(
        size.width / 4, size.height / 4, size.width / 2, size.height / 4);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height / 4, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
