import 'package:flutter/material.dart';
import 'menu.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o App')),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Objetivo da Aplicação',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Este aplicativo tem como objetivo facilitar o controle de fichas clínicas odontológicas, '
              'permitindo o cadastro de pacientes, histórico de consultas e agendamentos de forma eficiente '
              'e acessível aos profissionais da área odontológica.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Integrantes do Grupo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Rogerio Tanaka Pavao\n', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
