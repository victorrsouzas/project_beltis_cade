import 'package:caed/models/details_package.dart';
import 'package:caed/widgets/details_status_timeline.dart';
import 'package:flutter/material.dart';

Widget buildStatusView(List<Event> events) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Status do pacote',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      buildStatusTimeline(events),
    ],
  );
}
