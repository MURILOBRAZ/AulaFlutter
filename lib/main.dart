import 'package:flutter/material.dart';
import 'editar_perfil_page.dart';

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

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() {
    return _PerfilPageState();
  }
}

class _PerfilPageState extends State<PerfilPage> {
  String nome = 'João Silva';
  String curso = 'Engenharia da Computação';
  double media = 8.5;

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

              Text(
                nome,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                curso,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(
                    child: InfoCard(
                      titulo: 'Semestre',
                      valor: '4º',
                    ),
                  ),

                  const Expanded(
                    child: InfoCard(
                      titulo: 'RA',
                      valor: '123456',
                    ),
                  ),

                  Expanded(
                    child: InfoCard(
                      titulo: 'Média',
                      valor: media.toStringAsFixed(1),
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

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () async {
                    final resultado =
                        await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditarPerfilPage(
                          nome: nome,
                          curso: curso,
                          media: media,
                        ),
                      ),
                    );

                    if (resultado != null) {
                      setState(() {
                        nome = resultado['nome'];
                        curso = resultado['curso'];
                        media = resultado['media'];
                      });
                    }
                  },

                  child: const Text(
                    'Editar Perfil',
                  ),
                ),
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

            Text(
              'Progresso: $progresso%',
            ),
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