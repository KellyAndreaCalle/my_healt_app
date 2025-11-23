import 'package:app1/src/feature/widgets/my_healt_app_drawer.dart'; // Ajusta esta ruta si es necesario
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Si lo usas para navegar

class ZodiacScreen extends StatefulWidget {
  const ZodiacScreen({super.key});

  @override
  State<ZodiacScreen> createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  // --- VARIABLES DE LA IMAGEN ---
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _zodiacSign;

  // --- LÓGICA DE LA IMAGEN ---
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        // Llamamos a la función que calcula el signo
        _zodiacSign = _determineZodiacSign(pickedDate);
      });
    });
  }

  // --- LÓGICA AGREGADA (No estaba en la foto) ---
  String _determineZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Tauro";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Géminis";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cáncer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Escorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagitario";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricornio";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Acuario";
    } else {
      return "Piscis";
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // --- INTERFAZ VISUAL AGREGADA ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer importado de tus archivos anteriores
      drawer: const MyHealthAppDrawer(),
      appBar: AppBar(
        title: const Text('Calculadora Zodiacal'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para el nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Mostrar fecha seleccionada
            Text(
              _selectedDate == null
                  ? 'Ninguna fecha seleccionada'
                  : 'Fecha de nacimiento: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Botón para seleccionar fecha
            ElevatedButton(
              onPressed: _presentDatePicker,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Seleccionar fecha de nacimiento'),
            ),
            const SizedBox(height: 30),

            // Resultado del signo
            if (_zodiacSign != null)
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Hola, ${_nameController.text.isEmpty ? "Viajero" : _nameController.text}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Tu signo es: $_zodiacSign',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
