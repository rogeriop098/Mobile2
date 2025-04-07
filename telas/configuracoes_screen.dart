import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({super.key});

  @override
  State<ConfiguracoesScreen> createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  bool notificacoesAtivas = true;
  bool modoEscuro = false;

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Receber notificações'),
            value: notificacoesAtivas,
            onChanged: (value) {
              setState(() {
                notificacoesAtivas = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Modo Escuro (simulado)'),
            value: modoEscuro,
            onChanged: (value) {
              setState(() {
                modoEscuro = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    modoEscuro
                        ? 'Modo escuro ativado (simulação)'
                        : 'Modo claro ativado (simulação)',
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
