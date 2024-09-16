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
