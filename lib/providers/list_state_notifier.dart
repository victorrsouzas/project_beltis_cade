import 'dart:convert';
import 'package:caed/models/package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

// StateNotifier que gerencia o estado da lista de pacotes usando AsyncValue
class PackageListNotifier extends StateNotifier<AsyncValue<List<Package>>> {
  PackageListNotifier() : super(const AsyncValue.loading());

  // Função para buscar pacotes da API mock
  Future<void> fetchPackages() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://run.mocky.io/v3/c0bec6a2-9f7d-4707-84e2-a01c8998af91'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<Package> fetchedPackages =
            jsonData.map((item) => Package.fromJson(item)).toList();

        // Atualiza o estado para data (sucesso) com os pacotes recebidos
        state = AsyncValue.data(
            fetchedPackages); // Verifique se isso está sendo chamado
      } else {
        // Atualiza o estado para erro
        state =
            AsyncValue.error('Erro ao carregar os pacotes', StackTrace.current);
      }
    } catch (e) {
      developer.log('Error fetching packages: $e');
      // Atualiza o estado para erro com StackTrace
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Provider para o estado da lista de pacotes usando AsyncValue
final packageListProvider =
    StateNotifierProvider<PackageListNotifier, AsyncValue<List<Package>>>(
        (ref) {
  return PackageListNotifier();
});
