import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class Package {
  final String id;
  final String status;
  final int received;
  final int pending;

  Package({
    required this.id,
    required this.status,
    required this.received,
    required this.pending,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      status: json['status'],
      received: json['progress']['received'],
      pending: json['progress']['pending'],
    );
  }
}

class ListState {
  final List<Package> packages;

  ListState({
    required this.packages,
  });

  ListState copyWith({List<Package>? packages}) {
    return ListState(
      packages: packages ?? this.packages,
    );
  }
}

// StateNotifier que gerencia o estado da lista de pacotes
class PackageListNotifier extends StateNotifier<ListState> {
  PackageListNotifier() : super(ListState(packages: []));

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

        // Atualiza o estado com os pacotes recebidos da API
        state = state.copyWith(packages: fetchedPackages);
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      developer.log('Error fetching packages: $e');
    }
  }
}

// Provider para o estado da lista de pacotes
final packageListProvider =
    StateNotifierProvider<PackageListNotifier, ListState>((ref) {
  return PackageListNotifier();
});
