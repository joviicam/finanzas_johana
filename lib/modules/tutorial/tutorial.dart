import 'package:finanzas_johana/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  void _onItemTapped() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorial', true);
    Navigator.pushReplacementNamed(context, '/navigation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              children: [
                Image.asset('assets/default.png',
                    width: double.infinity, height: 200),
                const Center(
                  child: Text(
                    'Bienvenido a la aplicación',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Navigation(nextButton: true)));
                  },
                  child: const Text('Continuar'),
                ),
                InkWell(
                  onTap: () => _onItemTapped(),
                  child: const Text('Saltar tutorial'),
                )
              ],
            )));
  }
}
