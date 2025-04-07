import 'package:flutter/material.dart';

// Importações das telas
import 'login_screen.dart';
import 'home_screen.dart';
import 'pacientes_screen.dart';
import 'historico_screen.dart';
import 'perfil_screen.dart';
import 'configuracoes_screen.dart';
import 'agendamento_screen.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ficha Clínica Odonto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/pacientes': (context) => const PacientesScreen(),
        '/historico': (context) => const HistoricoScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/configuracoes': (context) => const ConfiguracoesScreen(),
        '/agendamentos': (context) => const AgendamentosScreen(),
        '/cadastro': (context) => const RegisterScreen(),
        '/esqueci_senha': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
