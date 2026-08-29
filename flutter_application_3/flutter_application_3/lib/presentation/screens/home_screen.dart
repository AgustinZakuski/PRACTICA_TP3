import 'package:flutter/material.dart';
import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/repository/animal_repository.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $user!'),
      ),
      body: _ListView(animals: AnimalRepository().getAnimals()),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Animal> animals;
  final AnimalRepository animalRepository = AnimalRepository();
  _ListView({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        return _ListItem(animal: animals[index]);
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  final Animal animal;
  final AnimalRepository animalRepository = AnimalRepository();

  _ListItem({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.push('/animal_detail', extra: animal);
        },
        title: Text(animal.name, style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
        subtitle: Text(animal.species, style: TextStyle(fontStyle: FontStyle.italic)),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(animal.imageUrls[0], fit: BoxFit.cover, width: 50, height: 70)),
      ),
    );
  }
}