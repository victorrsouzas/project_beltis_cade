import 'package:caed/providers/detail_state_notifier.dart';
import 'package:caed/widgets/details_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final String package = ModalRoute.of(context)?.settings.arguments as String;

    Future.microtask(() {
      ref.read(packageDetailProvider.notifier).setPackageDetails(package);
    });

    final packageState = ref.watch(packageDetailProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(packageState.packageName),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Status'),
              Tab(text: 'Dados'),
            ],
          ),
        ),
        body: packageState.packageName.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TabBarView(
                        children: [
                          buildStatusView(packageState.events),
                          const Center(child: Text('Dados do Pacote')),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
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
      ),
    );
  }
}
