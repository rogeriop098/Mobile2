import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController(
    text: 'Usuário Exemplo',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'usuario@exemplo.com',
  );
  final TextEditingController telefoneController = TextEditingController(
    text: '(11) 99999-9999',
  );
  final TextEditingController senhaController = TextEditingController(
    text: '123456',
  );

  void _salvarPerfil() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil do Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Informe seu nome'
                            : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Informe seu e-mail'
                            : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Informe seu telefone'
                            : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator:
                    (value) =>
                        value == null || value.length < 6
                            ? 'Senha muito curta'
                            : null,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _salvarPerfil,
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
