import 'package:caed/providers/list_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obter o estado da lista de pacotes
    final packageState =
        ref.watch(packageListProvider); // Use o provider correto

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Pacotes'),
      ),
      body: ListView.builder(
        itemCount: packageState.packages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(packageState.packages[index]),
            onTap: () {
              // Navegar para a página de detalhes passando o nome do pacote
              Navigator.of(context).pushNamed(
                '/Detail',
                arguments: packageState.packages[index],
              );
            },
          );
        },
      ),
    );
  }
}
