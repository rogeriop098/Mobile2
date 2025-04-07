import 'package:flutter/material.dart';

class PacientesScreen extends StatefulWidget {
  const PacientesScreen({super.key});

  @override
  State<PacientesScreen> createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  final List<Map<String, String>> pacientes = [];

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  void _adicionarPaciente() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Novo Paciente'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  nomeController.clear();
                  telefoneController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pacientes.add({
                      'nome': nomeController.text,
                      'telefone': telefoneController.text,
                    });
                  });
                  nomeController.clear();
                  telefoneController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Paciente adicionado!')),
                  );
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _adicionarPaciente,
          ),
        ],
      ),
      body:
          pacientes.isEmpty
              ? const Center(child: Text('Nenhum paciente cadastrado.'))
              : ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  final paciente = pacientes[index];
                  return ListTile(
                    title: Text(paciente['nome']!),
                    subtitle: Text('Telefone: ${paciente['telefone']}'),
                    leading: const Icon(Icons.person),
                  );
                },
              ),
    );
  }
}
