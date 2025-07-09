import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:massapp/providers/materials_provider.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Materials')),
      body: Consumer<MaterialsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.materials.length,
            itemBuilder: (context, index) {
              final material = provider.materials[index];
              return ListTile(
                title: Text(material.title),
                subtitle: Text(material.type),
              );
            },
          );
        },
      ),
    );
  }
}
