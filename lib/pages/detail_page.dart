import 'package:caed/providers/detail_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();
    // Não modifique o estado aqui.
  }

  @override
  Widget build(BuildContext context) {
    // Pega o pacote selecionado diretamente dos argumentos da rota
    final String package = ModalRoute.of(context)?.settings.arguments as String;

    // Aqui você pode chamar o provider de forma segura, após o build ser chamado
    Future.microtask(() {
      ref.read(packageDetailProvider.notifier).setPackageDetails(package);
    });

    // Obter o estado atual do pacote
    final packageState = ref.watch(packageDetailProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pacote'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              packageState.packageName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              packageState.packageDetails,
              style: const TextStyle(fontSize: 16),
            ),
            // Adicionar mais detalhes relevantes conforme necessário
          ],
        ),
      ),
    );
  }
}
