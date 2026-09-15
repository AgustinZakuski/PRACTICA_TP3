import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/presentation/animal_provider.dart';

class AnimalFormDialog extends ConsumerStatefulWidget {
  final Animal? animal; // Null = Crear, Not Null = Editar
  const AnimalFormDialog({super.key, this.animal});

  @override
  ConsumerState<AnimalFormDialog> createState() => _AnimalFormDialogState();
}

class _AnimalFormDialogState extends ConsumerState<AnimalFormDialog> {
  late TextEditingController nameCtrl;
  late TextEditingController speciesCtrl;
  late TextEditingController imageCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.animal?.name ?? '');
    speciesCtrl = TextEditingController(text: widget.animal?.species ?? '');
    imageCtrl = TextEditingController(
      text: widget.animal?.imageUrls.firstOrNull ?? '',
    );
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    speciesCtrl.dispose();
    imageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.animal != null;

    return AlertDialog(
      title: Text(isEditing ? 'Editar Animal' : 'Nuevo Animal'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: speciesCtrl,
              decoration: const InputDecoration(labelText: 'Especie'),
            ),
            TextField(
              controller: imageCtrl,
              decoration: const InputDecoration(labelText: 'URL Imagen'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            final animalData = Animal(
              id:
                  widget.animal?.id ??
                  DateTime.now().millisecondsSinceEpoch.toString(),
              name: nameCtrl.text,
              species: speciesCtrl.text,
              avgLifespan: widget.animal?.avgLifespan ?? '',
              description: widget.animal?.description ?? '',
              habitat: widget.animal?.habitat ?? '',
              diet: widget.animal?.diet ?? '',
              weight: widget.animal?.weight ?? '',
              height: widget.animal?.height ?? '',
              continent: widget.animal?.continent ?? '',
              conservationStatus: widget.animal?.conservationStatus ?? '',
              behavior: widget.animal?.behavior ?? '',
              funFact: widget.animal?.funFact ?? '',
              imageUrls: [
                imageCtrl.text.isEmpty
                    ? 'https://via.placeholder.com/150'
                    : imageCtrl.text,
              ],
            );

            if (isEditing) {
              ref.read(animalsProvider.notifier).update(animalData);
            } else {
              ref.read(animalsProvider.notifier).add(animalData);
            }
            Navigator.pop(context);
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
