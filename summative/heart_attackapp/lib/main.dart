import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PredictionPage(),
    );
  }
}

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final Map<String, TextEditingController> controllers = {
    'Age': TextEditingController(),
    'Cholesterol': TextEditingController(),
    'Heart Rate': TextEditingController(),
    'Diabetes': TextEditingController(),
    'Family History': TextEditingController(),
    'Smoking': TextEditingController(),
    'BMI': TextEditingController(),
    'Alcohol Consumption': TextEditingController(),
    'Exercise Hours/Week': TextEditingController(),
    'Previous Heart Problems': TextEditingController(),
    'Medication Use': TextEditingController(),
    'Stress Level': TextEditingController(),
    'Systolic BP': TextEditingController(),
    'Diastolic BP': TextEditingController(),
    'Triglycerides': TextEditingController(),
    'Blood Sugar': TextEditingController(),
    'Troponin': TextEditingController(),
  };

  String result = "";

  void predict() {
    setState(() {
      int age = int.tryParse(controllers['Age']!.text) ?? 0;
      int cholesterol = int.tryParse(controllers['Cholesterol']!.text) ?? 0;
      int bp = int.tryParse(controllers['Systolic BP']!.text) ?? 0;
      int heartRate = int.tryParse(controllers['Heart Rate']!.text) ?? 0;
      int stress = int.tryParse(controllers['Stress Level']!.text) ?? 0;

      if (age > 50 && cholesterol > 200 && bp > 130 && heartRate > 100 && stress > 7) {
        result = "High Risk of Heart Attack 💔";
      } else {
        result = "Low Risk ❤️";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Heart Attack Prediction",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: controllers.entries.map((entry) => buildInputField(entry.value, entry.key)).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: predict,
                  child: const Text("Predict", style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(height: 20),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
