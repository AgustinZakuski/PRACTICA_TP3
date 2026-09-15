import 'package:flutter/material.dart';
import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/presentation/animal_form_dialog.dart';
import 'package:flutter_application_3/presentation/animal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AnimalDetailScreen extends ConsumerWidget {
  const AnimalDetailScreen({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context, ref) {
    final animals = ref.watch(animalsProvider);
    final currentAnimal = animals.firstWhere(
      (a) => a.id == animal.id,
      orElse: () => animal,
    );
    return Scaffold(
      body: _DetailView(animal: currentAnimal, ref: ref),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView({super.key, required this.animal, required this.ref});

  final Animal animal;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AnimalFormDialog(animal: animal),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirmar eliminación'),
                        content: Text(
                          '¿Estás seguro de que querés eliminar a ${animal.name}?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              ref
                                  .read(animalsProvider.notifier)
                                  .delete(animal.id);
                              Navigator.pop(context); // Cierra el dialog
                              context.pop(); // Vuelve a la Home
                            },
                            child: const Text(
                              'Eliminar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),

            // Imagen principal (al tocar abre diálogo para cambiar la URL)
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                _showEditFieldDialog(
                  context: context,
                  ref: ref,
                  animal: animal,
                  fieldName: 'URL Imagen',
                  currentValue: animal.imageUrls.isNotEmpty
                      ? animal.imageUrls[0]
                      : '',
                  onUpdate: (newValue) =>
                      _updateAnimalField(animal, imageUrls: [newValue]),
                );
              },
              child: _DetailImg(imgs: animal.imageUrls),
            ),
            const SizedBox(height: 20),

            // Nombre
            InkWell(
              onTap: () {
                _showEditFieldDialog(
                  context: context,
                  ref: ref,
                  animal: animal,
                  fieldName: 'Nombre',
                  currentValue: animal.name,
                  onUpdate: (newValue) =>
                      _updateAnimalField(animal, name: newValue),
                );
              },
              child: Center(
                child: Text(
                  animal.name,
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Especie
            InkWell(
              onTap: () {
                _showEditFieldDialog(
                  context: context,
                  ref: ref,
                  animal: animal,
                  fieldName: 'Especie',
                  currentValue: animal.species,
                  onUpdate: (newValue) =>
                      _updateAnimalField(animal, species: newValue),
                );
              },
              child: Center(
                child: Text(
                  animal.species,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const _SectionTitle(icon: Icons.info_outline, title: 'About'),

            const SizedBox(height: 10),

            // Description / About
            Card(
              elevation: 5,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _showEditFieldDialog(
                    context: context,
                    ref: ref,
                    animal: animal,
                    fieldName: 'Descripción',
                    currentValue: animal.description,
                    onUpdate: (newValue) =>
                        _updateAnimalField(animal, description: newValue),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    animal.description.isEmpty
                        ? 'Toca para agregar descripción...'
                        : animal.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      color: animal.description.isEmpty ? Colors.grey : null,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const _SectionTitle(icon: Icons.info, title: 'Animal Information'),

            const SizedBox(height: 10),

            // Grid de Información Técnica
            _InfoGrid(
              children: [
                _InfoCard(
                  icon: Icons.timer_outlined,
                  title: 'Lifespan',
                  value: animal.avgLifespan,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Lifespan',
                      currentValue: animal.avgLifespan,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, avgLifespan: newValue),
                    );
                  },
                ),
                _InfoCard(
                  icon: Icons.home_outlined,
                  title: 'Habitat',
                  value: animal.habitat,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Habitat',
                      currentValue: animal.habitat,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, habitat: newValue),
                    );
                  },
                ),
                _InfoCard(
                  icon: Icons.restaurant_outlined,
                  title: 'Diet',
                  value: animal.diet,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Diet',
                      currentValue: animal.diet,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, diet: newValue),
                    );
                  },
                ),
                _InfoCard(
                  icon: Icons.monitor_weight_outlined,
                  title: 'Weight',
                  value: animal.weight,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Weight',
                      currentValue: animal.weight,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, weight: newValue),
                    );
                  },
                ),
                _InfoCard(
                  icon: Icons.height,
                  title: 'Height',
                  value: animal.height,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Height',
                      currentValue: animal.height,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, height: newValue),
                    );
                  },
                ),
                _InfoCard(
                  icon: Icons.public,
                  title: 'Continent',
                  value: animal.continent,
                  onTap: () {
                    _showEditFieldDialog(
                      context: context,
                      ref: ref,
                      animal: animal,
                      fieldName: 'Continent',
                      currentValue: animal.continent,
                      onUpdate: (newValue) =>
                          _updateAnimalField(animal, continent: newValue),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            const _SectionTitle(
              icon: Icons.warning_amber,
              title: 'Conservation',
            ),

            const SizedBox(height: 10),

            // Conservation Status
            Card(
              child: ListTile(
                onTap: () {
                  _showEditFieldDialog(
                    context: context,
                    ref: ref,
                    animal: animal,
                    fieldName: 'Conservation Status',
                    currentValue: animal.conservationStatus,
                    onUpdate: (newValue) => _updateAnimalField(
                      animal,
                      conservationStatus: newValue,
                    ),
                  );
                },
                leading: const Icon(Icons.shield_outlined),
                title: const Text(
                  'Conservation Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    animal.conservationStatus.isEmpty
                        ? 'Toca para agregar...'
                        : animal.conservationStatus,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: animal.conservationStatus.isEmpty
                          ? Colors.grey
                          : null,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const _SectionTitle(
              icon: Icons.psychology_alt_outlined,
              title: 'Behavior',
            ),

            const SizedBox(height: 10),

            // Behavior
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _showEditFieldDialog(
                    context: context,
                    ref: ref,
                    animal: animal,
                    fieldName: 'Behavior',
                    currentValue: animal.behavior,
                    onUpdate: (newValue) =>
                        _updateAnimalField(animal, behavior: newValue),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.psychology),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          animal.behavior.isEmpty
                              ? 'Toca para agregar comportamiento...'
                              : animal.behavior,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                height: 1.4,
                                color: animal.behavior.isEmpty
                                    ? Colors.grey
                                    : null,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const _SectionTitle(
              icon: Icons.lightbulb_outline,
              title: 'Fun Fact',
            ),

            const SizedBox(height: 10),

            // Fun Fact
            Card(
              color: const Color.fromARGB(255, 73, 75, 48),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _showEditFieldDialog(
                    context: context,
                    ref: ref,
                    animal: animal,
                    fieldName: 'Fun Fact',
                    currentValue: animal.funFact,
                    onUpdate: (newValue) =>
                        _updateAnimalField(animal, funFact: newValue),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.amber.shade100,
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          animal.funFact.isEmpty
                              ? 'Toca para agregar dato curioso...'
                              : animal.funFact,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                height: 1.4,
                                color: animal.funFact.isEmpty
                                    ? Colors.amber.shade100.withOpacity(0.5)
                                    : null,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailImg extends StatelessWidget {
  const _DetailImg({super.key, required this.imgs});

  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        imgs.isNotEmpty ? imgs[0] : '',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 300,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 300,
            color: Colors.grey.shade300,
            child: const Icon(
              Icons.image_not_supported_outlined,
              size: 60,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 23, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.45,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                value.isEmpty ? 'Toca para agregar' : value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: value.isEmpty ? Colors.grey : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showEditFieldDialog({
  required BuildContext context,
  required WidgetRef ref,
  required Animal animal,
  required String fieldName,
  required String currentValue,
  required Animal Function(String newValue) onUpdate,
}) {
  final controller = TextEditingController(text: currentValue);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Editar $fieldName'),
      content: TextField(
        controller: controller,
        autofocus: true,
        maxLines:
            (fieldName == 'Descripción' ||
                fieldName == 'Behavior' ||
                fieldName == 'Fun Fact')
            ? 3
            : 1,
        decoration: InputDecoration(labelText: fieldName),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedAnimal = onUpdate(controller.text);
            ref.read(animalsProvider.notifier).update(updatedAnimal);
            Navigator.pop(context);
          },
          child: const Text('Guardar'),
        ),
      ],
    ),
  );
}

// Función helper para clonar el objeto Animal con valores modificados
Animal _updateAnimalField(
  Animal animal, {
  String? name,
  String? species,
  String? avgLifespan,
  String? description,
  String? habitat,
  String? diet,
  String? weight,
  String? height,
  String? continent,
  String? conservationStatus,
  String? behavior,
  String? funFact,
  List<String>? imageUrls,
}) {
  return Animal(
    id: animal.id,
    name: name ?? animal.name,
    species: species ?? animal.species,
    avgLifespan: avgLifespan ?? animal.avgLifespan,
    description: description ?? animal.description,
    habitat: habitat ?? animal.habitat,
    diet: diet ?? animal.diet,
    weight: weight ?? animal.weight,
    height: height ?? animal.height,
    continent: continent ?? animal.continent,
    conservationStatus: conservationStatus ?? animal.conservationStatus,
    behavior: behavior ?? animal.behavior,
    funFact: funFact ?? animal.funFact,
    imageUrls: imageUrls ?? animal.imageUrls,
  );
}
