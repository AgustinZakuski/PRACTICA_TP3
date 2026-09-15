import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/repository/animal_repository.dart';

final animalsProvider = NotifierProvider<AnimalsNotifier, List<Animal>>(
  AnimalsNotifier.new,
);

class AnimalsNotifier extends Notifier<List<Animal>> {
  @override
  List<Animal> build() => AnimalRepository().getAnimals();

  void add(Animal animal) => state = [...state, animal];

  void update(Animal animal) {
    state = [for (final a in state) a.id == animal.id ? animal : a];
  }

  void delete(String id) {
    state = state.where((a) => a.id != id).toList();
  }
}
