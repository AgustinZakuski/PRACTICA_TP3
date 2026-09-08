import 'package:flutter/material.dart';
import 'package:flutter_application_3/domain/animal.dart';

class AnimalDetailScreen extends StatelessWidget {
  const AnimalDetailScreen({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    String name = animal.name;
    return Scaffold(
      body: _DetailView(animal: animal),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView({
    super.key,
    required this.animal,
  });

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailImg(imgs: animal.imageUrls),
            const SizedBox(height: 20,),

            Center(
              child: Text(animal.name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold
                )
              ),
            ),

            const SizedBox(height: 4),

            Center(
              child: Text(
                animal.species,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            ),

            const SizedBox(height: 10),

            _SectionTitle(icon: Icons.info_outline, title: 'About'),

            const SizedBox(height: 10),

            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  animal.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  )
                )
              ),
            ),

          const SizedBox(height: 20),

            _SectionTitle(icon: Icons.info, title: 'Animal Information'),

            const SizedBox(height: 10),

            _InfoGrid(
              children: [
                _InfoCard(
                  icon: Icons.timer_outlined,
                  title: 'Lifespan',
                  value: animal.avgLifespan,
                ),
                _InfoCard(
                  icon: Icons.home_outlined,
                  title: 'Habitat',
                  value: animal.habitat,
                ),
                _InfoCard(
                  icon: Icons.restaurant_outlined,
                  title: 'Diet',
                  value: animal.diet,
                ),
                _InfoCard(
                  icon: Icons.monitor_weight_outlined,
                  title: 'Weight',
                  value: animal.weight,
                ),
                _InfoCard(
                  icon: Icons.height,
                  title: 'Height',
                  value: animal.height,
                ),
                _InfoCard(
                  icon: Icons.public,
                  title: 'Continent',
                  value: animal.continent,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _SectionTitle(icon: Icons.warning_amber, title: 'Conservation'),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: Icon(Icons.shield_outlined),
                title: Text('Conservation Status', 
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                subtitle: Padding(
                  padding: EdgeInsetsGeometry.only(top: 4),
                  child: Text(
                    animal.conservationStatus,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),  
                ),
              ),
            ),

            const SizedBox(height: 20),

            _SectionTitle(icon: Icons.psychology_alt_outlined, title: 'Behavior'),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.psychology),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        animal.behavior,
                        style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.4),
                      ),
                    ),
                  ]
                ),
              ),
            ),

            const SizedBox(height: 20),

            _SectionTitle(icon: Icons.lightbulb_outline, title: 'Fun Fact'),

            const SizedBox(height: 10),

            Card(
              color: const Color.fromARGB(255, 73, 75, 48),
              child: Padding(
                padding: EdgeInsets.all(15),
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
                        animal.funFact,
                        style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class _DetailImg extends StatelessWidget {
  const _DetailImg({
    super.key,
    required this.imgs,
  });

  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        imgs[0],
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
  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 23, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid({
    required this.children,
  });

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
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
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
              value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}