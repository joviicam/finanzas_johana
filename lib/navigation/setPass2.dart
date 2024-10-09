import 'package:flutter/material.dart';

class Setpass2 extends StatefulWidget {
  const Setpass2({super.key});

  @override
  State<Setpass2> createState() => _SetPass2State();
}

class _SetPass2State extends State<Setpass2> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController _codigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey, // Asignamos la clave al formulario
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/default.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Código de verificación',
                    labelText: 'Código de verificación',
                  ),
                  controller: _codigo,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese el código de verificación';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('código: ${_codigo.text}');
                          Navigator.pushNamed(context, '/setPass3');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 144, 139, 144),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Válidar código'),
                    )),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )),
    ));
  }
}
