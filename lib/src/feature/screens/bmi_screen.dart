import 'package:app1/src/feature/widgets/my_healt_app_drawer.dart'; // Asegúrate de que esta ruta sea correcta
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 1. CAMBIO: Ahora extiende de StatefulWidget
class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double? _bmi;
  String? _category;

  // 2. BUENA PRÁCTICA: Liberar memoria de los controladores
  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100; // Convertir cm a metros
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters);
        _category = _determineCategory(_bmi!);
      });
    }
  }

  String _determineCategory(double bmi) {
    if (bmi < 18.5) {
      return "Bajo peso"; // Traducido al español para consistencia
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Sobrepeso";
    } else {
      return "Obesidad";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. AGREGADO: El Drawer (Menú lateral) para que la importación tenga sentido
      drawer: const MyHealthAppDrawer(),
      appBar: AppBar(
        title: const Text('Calculadora BMI'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
                hintText: 'Ingrese su peso en kilogramos',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                border: OutlineInputBorder(),
                hintText: 'Ingrese su estatura en centímetros',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Calcular BMI'),
            ),
            const SizedBox(height: 20),
            if (_bmi != null)
              Column(
                children: [
                  Text(
                    'Tu BMI es: ${_bmi!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Categoría: $_category',
                    style: TextStyle(
                      fontSize: 20,
                      color: _category == "Normal"
                          ? Colors.green
                          : Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
