import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:caed/models/details_package.dart';

class PackageDetailNotifier extends StateNotifier<DetailState> {
  PackageDetailNotifier() : super(DetailState(packageName: '', events: []));

  // Função para buscar os detalhes do pacote da API mock
  Future<void> setPackageDetails(String packageName) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://run.mocky.io/v3/93c13f2a-1ecd-41fb-8dd8-462c69797f2c'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        List<Event> events = (jsonData['events'] as List)
            .map((event) => Event.fromJson(event))
            .toList();

        state = state.copyWith(
          packageName: jsonData['packageName'],
          events: events,
        );
      } else {
        throw Exception('Erro ao carregar os detalhes do pacote');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}

final packageDetailProvider =
    StateNotifierProvider<PackageDetailNotifier, DetailState>((ref) {
  return PackageDetailNotifier();
});
