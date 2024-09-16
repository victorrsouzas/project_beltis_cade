import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListState {
  final List<String> packages;

  ListState({
    required this.packages,
  });

  ListState copyWith({List<String>? packages}) {
    return ListState(
      packages: packages ?? this.packages,
    );
  }
}

// StateNotifier que gerencia o estado da lista de pacotes
class PackageListNotifier extends StateNotifier<ListState> {
  PackageListNotifier()
      : super(ListState(packages: ['Pacote 1', 'Pacote 2', 'Pacote 3']));
}

// Provider para o estado da lista de pacotes
final packageListProvider =
    StateNotifierProvider<PackageListNotifier, ListState>((ref) {
  return PackageListNotifier();
});
