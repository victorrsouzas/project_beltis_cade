import 'package:caed/models/package.dart';
import 'package:flutter/material.dart';

Widget buildPackageList(BuildContext context, List<Package> packageList) {
  return ListView.builder(
    itemCount: packageList.length,
    itemBuilder: (context, index) {
      final package = packageList[index];

      // Mock para cores das barras
      Color bar1Color = (index % 2 == 0) ? Colors.lightBlue : Colors.grey;
      Color bar2Color = (index % 2 == 0) ? Colors.blue : Colors.grey;

      return Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10, right: 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(package.id),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Barra de progresso 1
                      Expanded(
                        child: Container(
                          height: 5,
                          color: bar1Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Barra de progresso 2
                      Expanded(
                        child: Container(
                          height: 5,
                          color: bar2Color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/Detail',
                arguments: package.id,
              );
            },
          ),
          const Divider(),
        ],
      );
    },
  );
}
