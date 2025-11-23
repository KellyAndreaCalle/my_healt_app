import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Asegúrate de que esta ruta coincida con la estructura de tus carpetas
import 'package:app1/src/feature/widgets/my_healt_app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyHealthAppDrawer(), // Menú lateral
      appBar: AppBar(
        title: const Text('Welcome to My App'),
        backgroundColor: const Color.fromARGB(255, 89, 0, 255),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- BOTÓN 1: CALCULADORA DE EDAD (Azul) ---
            ElevatedButton(
              onPressed: () => context.push('/age'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  233,
                  109,
                  185,
                ), // En tu foto: primary
                foregroundColor: const Color.fromARGB(
                  255,
                  255,
                  231,
                  249,
                ), // En tu foto: onPrimary
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Calculate Age'),
            ),

            const SizedBox(height: 20),

            // --- BOTÓN 2: BMI (Verde - Código de la segunda foto) ---
            ElevatedButton(
              onPressed: () => context.push('/bmi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 150, 114, 235),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Calculate BMI'),
            ),

            const SizedBox(height: 20),

            // --- BOTÓN 3: ZODIACO (Morado - Código de la segunda foto) ---
            ElevatedButton(
              onPressed: () => context.push('/zodiac'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 107, 198, 240),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              // Texto corregido según tu imagen:
              child: const Text('Determine Zodiac Sign'),
            ),
          ],
        ),
      ),
    );
  }
}
