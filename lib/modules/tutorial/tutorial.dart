import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              children: [
                Image.network('', width: double.infinity, height: 200),
                const Center(
                  child: Text(
                    'Bienvenido a la aplicación',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('tutorial', true);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Continuar'),
                )
              ],
            )));
  }
}
