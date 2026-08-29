import 'package:flutter_application_3/domain/animal.dart';

class AnimalRepository {
  List<Animal> _animals() {
    return [
      Animal(
        id: '1',
        name: 'Lion',
        species: 'Panthera leo',
        avgLifespan: '10-14 years',
        description:
            'The lion is one of the most iconic big cats in the world. Unlike most other big cats, lions are highly social animals that live together in groups called prides. Males are known for their impressive manes, while females usually do most of the hunting.',
        habitat: 'Savannas, grasslands, and open woodlands',
        diet: 'Carnivore',
        weight: '120-250 kg',
        height: '1.2 m',
        continent: 'Africa',
        conservationStatus: 'Vulnerable',
        behavior: 'Social and territorial',
        funFact:
            'Lions are the only big cats that naturally live in large social groups.',
        imageUrls: [
          'https://images.unsplash.com/photo-1546182990-dffeafbe841d',
        ],
      ),

      Animal(
        id: '2',
        name: 'African Elephant',
        species: 'Loxodonta africana',
        avgLifespan: '60-70 years',
        description:
            'The African elephant is the largest land animal on Earth. These highly intelligent mammals have excellent memories and strong social bonds. They live in family groups usually led by an older female known as the matriarch.',
        habitat: 'Savannas, forests, and wetlands',
        diet: 'Herbivore',
        weight: '2,700-6,000 kg',
        height: '2.5-4 m',
        continent: 'Africa',
        conservationStatus: 'Endangered',
        behavior: 'Highly social and intelligent',
        funFact:
            'Elephants can communicate using sounds that travel through the ground over long distances.',
        imageUrls: [
          'https://images.unsplash.com/photo-1557050543-4d5f4e07ef46',
        ],
      ),

      Animal(
        id: '3',
        name: 'Giraffe',
        species: 'Giraffa camelopardalis',
        avgLifespan: '20-25 years',
        description:
            'The giraffe is the tallest living land animal, easily recognized by its extremely long neck and distinctive spotted coat. Its height allows it to reach leaves high above the ground where many other herbivores cannot feed.',
        habitat: 'Savannas, grasslands, and open woodlands',
        diet: 'Herbivore',
        weight: '550-1,200 kg',
        height: '4.5-6 m',
        continent: 'Africa',
        conservationStatus: 'Vulnerable',
        behavior: 'Generally peaceful and social',
        funFact:
            'A giraffe’s tongue can be around 45 cm long and is specially adapted for grabbing leaves.',
        imageUrls: [
          'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
        ],
      ),

      Animal(
        id: '4',
        name: 'Tiger',
        species: 'Panthera tigris',
        avgLifespan: '10-15 years',
        description:
            'The tiger is the largest living cat species and one of the most powerful predators on Earth. Tigers are generally solitary animals and rely on stealth, strength, and their distinctive striped coats to hunt prey.',
        habitat: 'Forests, grasslands, and wetlands',
        diet: 'Carnivore',
        weight: '75-300 kg',
        height: '0.9-1.2 m',
        continent: 'Asia',
        conservationStatus: 'Endangered',
        behavior: 'Solitary and territorial',
        funFact:
            'Every tiger has a unique stripe pattern, similar to how humans have unique fingerprints.',
        imageUrls: [
          'https://images.unsplash.com/photo-1561731216-c3a4d99437d5',
        ],
      ),

      Animal(
        id: '5',
        name: 'Emperor Penguin',
        species: 'Aptenodytes forsteri',
        avgLifespan: '15-20 years',
        description:
            'The emperor penguin is the largest penguin species and is specially adapted to survive the extreme conditions of Antarctica. During winter, these penguins form large groups to conserve body heat and protect themselves from freezing temperatures.',
        habitat: 'Antarctic ice and coastal waters',
        diet: 'Carnivore',
        weight: '22-45 kg',
        height: '1.1-1.3 m',
        continent: 'Antarctica',
        conservationStatus: 'Near Threatened',
        behavior: 'Social and highly adapted to cold',
        funFact:
            'Emperor penguins can survive temperatures below -50°C and extremely strong Antarctic winds.',
        imageUrls: [
          'https://images.unsplash.com/photo-1551986782-d0169b3f8fa7',
        ],
      ),

      Animal(
        id: '6',
        name: 'Giant Panda',
        species: 'Ailuropoda melanoleuca',
        avgLifespan: '15-20 years',
        description:
            'The giant panda is a bear native to the mountainous forests of central China. Its distinctive black-and-white fur makes it one of the most recognizable animals in the world. Although it belongs to the order Carnivora, bamboo makes up most of its diet.',
        habitat: 'Mountainous bamboo forests',
        diet: 'Mostly herbivore',
        weight: '70-120 kg',
        height: '0.6-0.9 m',
        continent: 'Asia',
        conservationStatus: 'Vulnerable',
        behavior: 'Mostly solitary and peaceful',
        funFact:
            'Pandas spend many hours each day eating bamboo because it provides relatively little energy.',
        imageUrls: [
          'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7',
        ],
      ),

      Animal(
        id: '7',
        name: 'Bottlenose Dolphin',
        species: 'Tursiops truncatus',
        avgLifespan: '40-60 years',
        description:
            'The bottlenose dolphin is a highly intelligent marine mammal famous for its playful behavior and complex communication. Dolphins live in groups called pods and use echolocation to navigate, communicate, and locate prey underwater.',
        habitat: 'Oceans, coastal waters, and bays',
        diet: 'Carnivore',
        weight: '150-650 kg',
        height: 'N/A',
        continent: 'Worldwide',
        conservationStatus: 'Least Concern',
        behavior: 'Highly social and intelligent',
        funFact:
            'Dolphins use echolocation by producing clicks and listening for the returning echoes.',
        imageUrls: [
          'https://images.unsplash.com/photo-1607153333879-c174d265f1d2',
        ],
      ),

      Animal(
        id: '8',
        name: 'Grey Wolf',
        species: 'Canis lupus',
        avgLifespan: '6-8 years',
        description:
            'The grey wolf is a highly social predator that usually lives and hunts in packs. Wolves have complex social structures and communicate through vocalizations, body language, and scent marking. They can adapt to a wide variety of environments.',
        habitat: 'Forests, tundra, mountains, and grasslands',
        diet: 'Carnivore',
        weight: '25-80 kg',
        height: '0.6-0.9 m',
        continent: 'North America, Europe, and Asia',
        conservationStatus: 'Least Concern',
        behavior: 'Social and cooperative',
        funFact:
            'Wolves can travel enormous distances while searching for food and defending their territory.',
        imageUrls: [
          'https://images.unsplash.com/photo-1653906253442-2b532873eb88?auto=format&fit=crop&w=800&q=80',
        ],
      ),

      Animal(
        id: '9',
        name: 'Polar Bear',
        species: 'Ursus maritimus',
        avgLifespan: '15-18 years',
        description:
            'The polar bear is the largest land carnivore and is perfectly adapted to life in the Arctic. Its thick layer of body fat and dense fur help protect it from freezing temperatures. Polar bears are excellent swimmers and spend much of their time hunting on sea ice.',
        habitat: 'Arctic sea ice and coastal regions',
        diet: 'Carnivore',
        weight: '150-700 kg',
        height: '1.2-1.6 m',
        continent: 'North America and Europe',
        conservationStatus: 'Vulnerable',
        behavior: 'Mostly solitary',
        funFact:
            'Despite their white appearance, polar bears actually have black skin underneath their fur.',
        imageUrls: [
          'https://images.unsplash.com/photo-1589656966895-2f33e7653819',
        ],
      ),

      Animal(
        id: '10',
        name: 'Koala',
        species: 'Phascolarctos cinereus',
        avgLifespan: '10-15 years',
        description:
            'The koala is an arboreal marsupial native to Australia. It spends most of its time resting in eucalyptus trees and feeds almost exclusively on eucalyptus leaves. Koalas have a very low-energy lifestyle because their diet provides relatively little nutrition.',
        habitat: 'Eucalyptus forests and woodlands',
        diet: 'Herbivore',
        weight: '4-15 kg',
        height: '60-85 cm',
        continent: 'Australia',
        conservationStatus: 'Vulnerable',
        behavior: 'Mostly solitary and sedentary',
        funFact:
            'Koalas can sleep for up to around 20 hours a day.',
        imageUrls: [
          'https://images.unsplash.com/photo-1459262838948-3e2de6c1ec80',
        ],
      ),

      Animal(
        id: '11',
        name: 'Dog',
        species: 'Canis lupus familiaris',
        avgLifespan: '10-13 years',
        description:
            'The domestic dog is one of the most widespread companion animals in the world. Humans have selectively bred dogs for thousands of years, resulting in hundreds of breeds with different sizes, appearances, personalities, and abilities.',
        habitat: 'Human environments worldwide',
        diet: 'Omnivore',
        weight: '1-90+ kg depending on breed',
        height: '15-90+ cm depending on breed',
        continent: 'Worldwide',
        conservationStatus: 'Domesticated',
        behavior: 'Social and highly trainable',
        funFact:
            'Dogs have an incredible sense of smell and some can detect scents at concentrations millions of times lower than humans can.',
        imageUrls: [
          'https://images.unsplash.com/photo-1552053831-71594a27632d',
        ],
      ),

      Animal(
        id: '12',
        name: 'Cat',
        species: 'Felis catus',
        avgLifespan: '12-18 years',
        description:
            'The domestic cat is a small carnivorous mammal that has lived alongside humans for thousands of years. Cats are agile hunters with excellent hearing, vision, balance, and reflexes. They are known for their independent personalities and ability to adapt to different environments.',
        habitat: 'Human environments worldwide',
        diet: 'Carnivore',
        weight: '3-6 kg',
        height: '20-25 cm',
        continent: 'Worldwide',
        conservationStatus: 'Domesticated',
        behavior: 'Independent and territorial',
        funFact:
            'Cats spend a large part of their lives grooming themselves to keep their fur clean.',
        imageUrls: [
          'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
        ],
      ),

      Animal(
        id: '13',
        name: 'Horse',
        species: 'Equus ferus caballus',
        avgLifespan: '25-30 years',
        description:
            'The horse is a large domesticated mammal that has played an important role in transportation, agriculture, warfare, sport, and human culture. Horses are social animals with strong memories and highly developed senses.',
        habitat: 'Grasslands, farms, and open plains',
        diet: 'Herbivore',
        weight: '380-1,000 kg',
        height: '1.4-1.8 m',
        continent: 'Worldwide',
        conservationStatus: 'Domesticated',
        behavior: 'Social and herd-oriented',
        funFact:
            'Horses can sleep both standing up and lying down.',
        imageUrls: [
          'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a',
        ],
      ),

      Animal(
        id: '14',
        name: 'Rabbit',
        species: 'Oryctolagus cuniculus',
        avgLifespan: '8-12 years',
        description:
            'The rabbit is a small herbivorous mammal recognized by its long ears, powerful hind legs, and soft fur. Wild rabbits are social animals that often live in groups and create complex underground burrow systems called warrens.',
        habitat: 'Grasslands, forests, and agricultural areas',
        diet: 'Herbivore',
        weight: '1-2.5 kg',
        height: '25-40 cm',
        continent: 'Europe and introduced populations worldwide',
        conservationStatus: 'Least Concern',
        behavior: 'Social and alert',
        funFact:
            'A rabbit’s teeth never stop growing, so it needs to constantly chew to keep them under control.',
        imageUrls: [
          'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308',
        ],
      ),

      Animal(
        id: '15',
        name: 'Red Fox',
        species: 'Vulpes vulpes',
        avgLifespan: '3-5 years',
        description:
            'The red fox is one of the most widely distributed carnivorous mammals in the world. It is highly adaptable and can survive in forests, grasslands, deserts, mountains, and even urban environments.',
        habitat: 'Forests, grasslands, mountains, and cities',
        diet: 'Omnivore',
        weight: '3-14 kg',
        height: '35-50 cm',
        continent: 'North America, Europe, Asia, and Australia',
        conservationStatus: 'Least Concern',
        behavior: 'Mostly solitary and adaptable',
        funFact:
            'Foxes have excellent hearing and can detect small animals moving underground or beneath snow.',
        imageUrls: [
          'https://images.unsplash.com/photo-1516934024742-b461fba47600',
        ],
      ),

      Animal(
        id: '16',
        name: 'Axolotl',
        species: 'Ambystoma mexicanum',
        avgLifespan: '10-15 years',
        description:
            'The axolotl is a unique aquatic salamander native to the lakes around Mexico City. Unlike most amphibians, it usually remains in its juvenile aquatic form throughout its entire life. It is especially famous for its remarkable ability to regenerate parts of its body.',
        habitat: 'Freshwater lakes and canals',
        diet: 'Carnivore',
        weight: '60-110 g',
        height: '15-30 cm',
        continent: 'North America',
        conservationStatus: 'Critically Endangered',
        behavior: 'Mostly solitary and aquatic',
        funFact:
            'Axolotls can regenerate limbs and repair several types of damaged tissues.',
        imageUrls: [
          'https://images.unsplash.com/photo-1763755876890-a3acebd28ed5?auto=format&fit=crop&w=800&q=80',
        ],
      ),

      Animal(
        id: '17',
        name: 'Narwhal',
        species: 'Monodon monoceros',
        avgLifespan: '50-60 years',
        description:
            'The narwhal is an Arctic whale famous for the long spiral tusk that grows from the upper jaw of most males and some females. The tusk is actually an elongated tooth and can grow several meters long. Narwhals live in groups and are specially adapted to life beneath Arctic sea ice.',
        habitat: 'Arctic oceans and sea ice',
        diet: 'Carnivore',
        weight: '800-1,600 kg',
        height: 'N/A',
        continent: 'North America and Europe',
        conservationStatus: 'Least Concern',
        behavior: 'Social and migratory',
        funFact:
            'The narwhal’s tusk can contain millions of tiny nerve endings and may help it sense changes in its environment.',
        imageUrls: [
          'https://static.wikia.nocookie.net/reinoanimalia/images/d/d1/Narval.jpg/revision/latest?cb=20180730072457&path-prefix=es',
        ],
      ),

      Animal(
        id: '18',
        name: 'Okapi',
        species: 'Okapia johnstoni',
        avgLifespan: '15-20 years',
        description:
            'The okapi is a shy mammal found in the dense forests of the Democratic Republic of the Congo. Although its legs have zebra-like stripes, the okapi is actually the closest living relative of the giraffe.',
        habitat: 'Dense tropical rainforests',
        diet: 'Herbivore',
        weight: '200-350 kg',
        height: '1.5-1.7 m',
        continent: 'Africa',
        conservationStatus: 'Endangered',
        behavior: 'Solitary and shy',
        funFact:
            'The okapi’s long tongue can reach around 45 cm and helps it grab leaves and clean its eyes and ears.',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvsTZcW5jV1_DAf9Rk96oywvTquTaa8Fkq3N48yeeXp49j5MDHi1XVycXP-TPTOEyzQFo3-k5CyqbjCqrtp7bhplRj6x6Vsx2wE81HIQs&s=10',
        ],
      ),

      Animal(
        id: '19',
        name: 'Ocean Sunfish',
        species: 'Mola mola',
        avgLifespan: '10-15 years',
        description:
            'The ocean sunfish is one of the heaviest bony fish in the world. Its enormous, flattened body and unusual shape make it easy to recognize. Despite its size, it feeds mostly on relatively small prey such as jellyfish and other soft-bodied marine animals.',
        habitat: 'Tropical and temperate oceans',
        diet: 'Carnivore',
        weight: '250-2,000 kg',
        height: 'Up to 3.3 m',
        continent: 'Worldwide oceans',
        conservationStatus: 'Vulnerable',
        behavior: 'Mostly solitary',
        funFact:
            'Ocean sunfish can grow to enormous sizes while having a surprisingly simple body shape.',
        imageUrls: [
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Mola_mola.jpg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=original',
        ],
      ),

      Animal(
        id: '20',
        name: 'Aye-aye',
        species: 'Daubentonia madagascariensis',
        avgLifespan: '20-25 years',
        description:
            'The aye-aye is a bizarre and fascinating nocturnal primate native to Madagascar. It has enormous ears, large continuously growing incisors, and an unusually long middle finger that it uses to find and extract insects hidden inside tree trunks.',
        habitat: 'Tropical forests of Madagascar',
        diet: 'Omnivore',
        weight: '2-3 kg',
        height: '35-45 cm',
        continent: 'Africa',
        conservationStatus: 'Endangered',
        behavior: 'Nocturnal and mostly solitary',
        funFact:
            'The aye-aye taps on tree trunks with its finger and listens for hollow sounds that may indicate hidden insects.',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa7nM1J-dvRpvu1ANcliItwwvoAsNgTxVEKilifE-H2Q&s=10',
        ],
      ),
    ];
  }

  List<Animal> getAnimals() {
    return _animals();
  }
}