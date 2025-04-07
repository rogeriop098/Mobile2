import 'package:flutter/material.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> historico = [
      {
        'paciente': 'Ana Souza',
        'data': '05/04/2025',
        'observacoes': 'Limpeza e orientação.',
      },
      {
        'paciente': 'Carlos Lima',
        'data': '03/04/2025',
        'observacoes': 'Consulta inicial. Raio-X solicitado.',
      },
      {
        'paciente': 'Fernanda Rocha',
        'data': '01/04/2025',
        'observacoes': 'Extração de dente siso.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Consultas')),
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          final consulta = historico[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.history),
              title: Text('${consulta['paciente']} - ${consulta['data']}'),
              subtitle: Text(consulta['observacoes'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
