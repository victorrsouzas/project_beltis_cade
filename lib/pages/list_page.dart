import 'package:caed/widgets/package_list.dart';
import 'package:caed/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:caed/providers/list_state_notifier.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageState = ref.watch(packageListProvider);
    final packageNotifier = ref.read(packageListProvider.notifier);

    // Buscar pacotes da API ao carregar a página
    packageNotifier.fetchPackages();

    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Listagem de Pacotes'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildStatusCard(
                      title: 'Recebimento de pacotes',
                      received: 1560,
                      total: 2000,
                      color: Colors.lightBlue,
                      screenWidth: screenWidth * 0.2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    buildStatusCard(
                      title: 'Devolução de pacotes',
                      received: 1200,
                      total: 1600,
                      color: Colors.blue,
                      screenWidth: screenWidth * 0.2,
                    ),
                  ],
                ),
              ),
            ),

            const TabBar(
              tabs: [
                Tab(text: 'Pacotes'),
                Tab(text: 'Status'),
                Tab(text: 'Dados'),
              ],
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.filter_list),
                  SizedBox(width: 8),
                  Text(
                    'Lista de pacotes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  buildPackageList(context, packageState),
                  const Center(child: Text('Status')),
                  const Center(child: Text('Dados')),
                ],
              ),
            ),

            // Barra de navegação inferior
            BottomNavigationBar(
              currentIndex: 0,
              onTap: (index) {
                // Atualize a navegação conforme o índice
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Início',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Opções',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline),
                  label: 'Tutoriais',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
