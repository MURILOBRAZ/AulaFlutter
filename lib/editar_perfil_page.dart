import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  final String nome;
  final String curso;
  final double media;

  const EditarPerfilPage({
    super.key,
    required this.nome,
    required this.curso,
    required this.media,
  });

  @override
  State<EditarPerfilPage> createState() {
    return _EditarPerfilPageState();
  }
}

class _EditarPerfilPageState
    extends State<EditarPerfilPage> {

  late TextEditingController nomeController;
  late TextEditingController cursoController;

  late double media;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(
      text: widget.nome,
    );

    cursoController = TextEditingController(
      text: widget.curso,
    );

    media = widget.media;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Perfil',
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              TextField(
                controller: nomeController,

                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: cursoController,

                decoration: const InputDecoration(
                  labelText: 'Curso',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Média: ${media.toStringAsFixed(1)}',
              ),

              Slider(
                value: media,
                min: 0,
                max: 10,
                divisions: 20,
                label: media.toStringAsFixed(1),

                onChanged: (valor) {
                  setState(() {
                    media = valor;
                  });
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      {
                        'nome':
                            nomeController.text,
                        'curso':
                            cursoController.text,
                        'media': media,
                      },
                    );
                  },

                  child: const Text(
                    'Salvar',
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