import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Pacientes'),
            onTap: () => Navigator.pushNamed(context, '/pacientes'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico'),
            onTap: () => Navigator.pushNamed(context, '/historico'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Agendamentos'),
            onTap: () => Navigator.pushNamed(context, '/agendamentos'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () => Navigator.pushNamed(context, '/perfil'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => Navigator.pushNamed(context, '/configuracoes'),
          ),
        ],
      ),
    );
  }
}
