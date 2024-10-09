import 'package:flutter/material.dart';

class Setpass3 extends StatefulWidget {
  const Setpass3({super.key});

  @override
  State<Setpass3> createState() => _SetPass3State();
}

class _SetPass3State extends State<Setpass3> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

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
                    hintText: 'Contraseña',
                    label: Text('Contraseña'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Repetir Contraseña',
                    label: Text('Repetir Contraseña'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: _password2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_password.text == _password2.text) {
                            Navigator.pushNamed(context, '/login');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Contraseña reestablecida, ya puedes iniciar sesión'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Las contraseñas no coinciden'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 144, 139, 144),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Guardar'),
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
