import 'package:flutter/material.dart';

class Setpass1 extends StatefulWidget {
  const Setpass1({super.key});

  @override
  State<Setpass1> createState() => _SetPass1State();
}

class _SetPass1State extends State<Setpass1> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController _email = TextEditingController();

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
                    hintText: 'Correo electrónico',
                    labelText: 'Correo electrónico',
                  ),
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico';
                    }
                    // Puedes agregar más validaciones aquí si es necesario
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validamos el formulario cuando se presiona el botón
                        if (_formKey.currentState!.validate()) {
                          // Si el formulario es válido, muestra los valores y navega a la siguiente pantalla
                          print('Email: ${_email.text}');
                          Navigator.pushNamed(context, '/setPass2');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 144, 139, 144),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Enviar código'),
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
