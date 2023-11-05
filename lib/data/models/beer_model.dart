import 'package:nonstopioassignment/domain/entities/beer_entity.dart';

class BeerModel extends Beer {
  BeerModel({
    super.id,
    super.name,
    super.tagline,
    super.firstBrewed,
    super.description,
    super.imageUrl,
    super.abv,
    super.ibu,
    super.targetFg,
    super.targetOg,
    super.ebc,
    super.srm,
    super.ph,
    super.attenuationLevel,
  });

  factory BeerModel.fromJson(Map<String, dynamic> json) {
    return BeerModel(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      firstBrewed: json['first_brewed'],
      description: json['description'],
      imageUrl: json['image_url'],
      abv: json['abv'],
      ibu: json['ibu'],
      targetFg: json['target_fg'],
      targetOg: json['target_og'],
      ebc: json['ebc'],
      srm: json['srm'],
      ph: json['ph'],
      attenuationLevel: json['attenuation_level'],
    );
  }
}
