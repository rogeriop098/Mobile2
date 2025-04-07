import 'package:flutter/material.dart';
import 'menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Início')),
      drawer: const DrawerMenu(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildCard(context, Icons.person, 'Pacientes', '/pacientes'),
          _buildCard(context, Icons.history, 'Histórico', '/historico'),
          _buildCard(
            context,
            Icons.calendar_today,
            'Agendamentos',
            '/agendamentos',
          ),
          _buildCard(context, Icons.account_circle, 'Perfil', '/perfil'),
          _buildCard(
            context,
            Icons.settings,
            'Configurações',
            '/configuracoes',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.blue),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
