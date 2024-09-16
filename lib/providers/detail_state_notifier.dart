import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailState {
  final String packageName;
  final String packageDetails;

  DetailState({
    required this.packageName,
    required this.packageDetails,
  });

  DetailState copyWith({String? packageName, String? packageDetails}) {
    return DetailState(
      packageName: packageName ?? this.packageName,
      packageDetails: packageDetails ?? this.packageDetails,
    );
  }
}

class PackageDetailNotifier extends StateNotifier<DetailState> {
  PackageDetailNotifier()
      : super(DetailState(packageName: '', packageDetails: ''));

  // Função para definir o pacote selecionado
  void setPackageDetails(String packageName) {
    state = state.copyWith(
      packageName: packageName,
      packageDetails: 'Detalhes do pacote $packageName', // Detalhe mock
    );
  }
}

// Provider para o estado de detalhes do pacote
final packageDetailProvider =
    StateNotifierProvider<PackageDetailNotifier, DetailState>((ref) {
  return PackageDetailNotifier();
});
