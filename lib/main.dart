import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilPage(),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Perfil do aluno'),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'João Silva',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Engenharia da Computação',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    child: InfoCard(
                      titulo: 'Semestre',
                      valor: '4º',
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      titulo: 'RA',
                      valor: '123456',
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      titulo: 'Média',
                      valor: '8.5',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Minhas disciplinas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DisciplinaCard(
                nome: 'Programação Mobile',
                progresso: 70,
              ),
              const DisciplinaCard(
                nome: 'Banco de Dados',
                progresso: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisciplinaCard extends StatelessWidget {
  final String nome;
  final int progresso;

  const DisciplinaCard({
    super.key,
    required this.nome,
    required this.progresso,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
            CrossAxisAlignment.start,
          children: [
            Text(
              nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Progresso: $progresso%'),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  const InfoCard({
    super.key,
    required this.titulo,
    required this.valor,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(titulo),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}