class Animal {
  String name;
  Taxonomy taxonomy;
  List<String> locations;
  Characteristics characteristics;

  Animal({
    required this.name,
    required this.taxonomy,
    required this.locations,
    required this.characteristics,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        name: json["name"],
        taxonomy: Taxonomy.fromJson(json["taxonomy"]),
        locations: List<String>.from(json["locations"].map((x) => x)),
        characteristics: Characteristics.fromJson(json["characteristics"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "taxonomy": taxonomy.toJson(),
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "characteristics": characteristics.toJson(),
      };
}

class Characteristics {
  String prey;
  String nameOfYoung;
  String groupBehavior;
  String estimatedPopulationSize;
  String biggestThreat;
  String mostDistinctiveFeature;
  String gestationPeriod;
  String habitat;
  String diet;
  String averageLitterSize;
  String lifestyle;
  String commonName;
  String numberOfSpecies;
  String location;
  String slogan;
  String group;
  String color;
  String skinType;
  String topSpeed;
  String lifespan;
  String weight;
  String height;
  String ageOfSexualMaturity;
  String ageOfWeaning;

  Characteristics({
    required this.prey,
    required this.nameOfYoung,
    required this.groupBehavior,
    required this.estimatedPopulationSize,
    required this.biggestThreat,
    required this.mostDistinctiveFeature,
    required this.gestationPeriod,
    required this.habitat,
    required this.diet,
    required this.averageLitterSize,
    required this.lifestyle,
    required this.commonName,
    required this.numberOfSpecies,
    required this.location,
    required this.slogan,
    required this.group,
    required this.color,
    required this.skinType,
    required this.topSpeed,
    required this.lifespan,
    required this.weight,
    required this.height,
    required this.ageOfSexualMaturity,
    required this.ageOfWeaning,
  });

  factory Characteristics.fromJson(Map<String, dynamic> json) =>
      Characteristics(
        prey: json["prey"] ?? "",
        nameOfYoung: json["name_of_young"] ?? "",
        groupBehavior: json["group_behavior"] ?? "",
        estimatedPopulationSize: json["estimated_population_size"] ?? "",
        biggestThreat: json["biggest_threat"] ?? "",
        mostDistinctiveFeature: json["most_distinctive_feature"] ?? "",
        gestationPeriod: json["gestation_period"] ?? "",
        habitat: json["habitat"] ?? "",
        diet: json["diet"] ?? "",
        averageLitterSize: json["average_litter_size"] ?? "",
        lifestyle: json["lifestyle"] ?? "",
        commonName: json["common_name"] ?? "",
        numberOfSpecies: json["number_of_species"] ?? "",
        location: json["location"] ?? "",
        slogan: json["slogan"] ?? "",
        group: json["group"] ?? "",
        color: json["color"] ?? "",
        skinType: json["skin_type"] ?? "",
        topSpeed: json["top_speed"] ?? "",
        lifespan: json["lifespan"] ?? "",
        weight: json["weight"] ?? "",
        height: json["height"] ?? "",
        ageOfSexualMaturity: json["age_of_sexual_maturity"] ?? "",
        ageOfWeaning: json["age_of_weaning"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "prey": prey,
        "name_of_young": nameOfYoung,
        "group_behavior": groupBehavior,
        "estimated_population_size": estimatedPopulationSize,
        "biggest_threat": biggestThreat,
        "most_distinctive_feature": mostDistinctiveFeature,
        "gestation_period": gestationPeriod,
        "habitat": habitat,
        "diet": diet,
        "average_litter_size": averageLitterSize,
        "lifestyle": lifestyle,
        "common_name": commonName,
        "number_of_species": numberOfSpecies,
        "location": location,
        "slogan": slogan,
        "group": group,
        "color": color,
        "skin_type": skinType,
        "top_speed": topSpeed,
        "lifespan": lifespan,
        "weight": weight,
        "height": height,
        "age_of_sexual_maturity": ageOfSexualMaturity,
        "age_of_weaning": ageOfWeaning,
      };
}

class Taxonomy {
  String kingdom;
  String phylum;
  String taxonomyClass;
  String order;
  String family;
  String genus;
  String scientificName;

  Taxonomy({
    required this.kingdom,
    required this.phylum,
    required this.taxonomyClass,
    required this.order,
    required this.family,
    required this.genus,
    required this.scientificName,
  });

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
        kingdom: json["kingdom"],
        phylum: json["phylum"],
        taxonomyClass: json["class"],
        order: json["order"],
        family: json["family"],
        genus: json["genus"] ?? "",
        scientificName: json["scientific_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "kingdom": kingdom,
        "phylum": phylum,
        "class": taxonomyClass,
        "order": order,
        "family": family,
        "genus": genus,
        "scientific_name": scientificName,
      };
}
