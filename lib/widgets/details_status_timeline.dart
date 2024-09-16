import 'package:caed/models/details_package.dart';
import 'package:flutter/material.dart';

Widget buildStatusTimeline(List<Event> events) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: List.generate(events.length, (index) {
          final event = events[index];
          final isLast = index == events.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(event.date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(event.time,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: event.color == 'lightBlue'
                          ? Colors.lightBlue
                          : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  event.description,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        }),
      ),
    ),
  );
}
