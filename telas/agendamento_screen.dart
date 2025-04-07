import 'package:flutter/material.dart';

class AgendamentosScreen extends StatefulWidget {
  const AgendamentosScreen({super.key});

  @override
  State<AgendamentosScreen> createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState extends State<AgendamentosScreen> {
  final List<Map<String, String>> agendamentos = [];

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController horaController = TextEditingController();

  void _adicionarAgendamento() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Novo Agendamento'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Paciente'),
                  ),
                  TextField(
                    controller: dataController,
                    decoration: const InputDecoration(
                      labelText: 'Data (dd/mm/aaaa)',
                    ),
                  ),
                  TextField(
                    controller: horaController,
                    decoration: const InputDecoration(
                      labelText: 'Horário (hh:mm)',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  nomeController.clear();
                  dataController.clear();
                  horaController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nomeController.text.isEmpty ||
                      dataController.text.isEmpty ||
                      horaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos')),
                    );
                    return;
                  }

                  setState(() {
                    agendamentos.add({
                      'paciente': nomeController.text,
                      'data': dataController.text,
                      'hora': horaController.text,
                    });
                  });

                  nomeController.clear();
                  dataController.clear();
                  horaController.clear();
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Consulta agendada!')),
                  );
                },
                child: const Text('Agendar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _adicionarAgendamento,
          ),
        ],
      ),
      body:
          agendamentos.isEmpty
              ? const Center(child: Text('Nenhum agendamento ainda.'))
              : ListView.builder(
                itemCount: agendamentos.length,
                itemBuilder: (context, index) {
                  final consulta = agendamentos[index];
                  return ListTile(
                    leading: const Icon(Icons.event_note),
                    title: Text(consulta['paciente'] ?? ''),
                    subtitle: Text(
                      'Data: ${consulta['data']} às ${consulta['hora']}',
                    ),
                  );
                },
              ),
    );
  }
}
