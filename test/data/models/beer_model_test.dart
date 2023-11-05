import 'package:flutter_test/flutter_test.dart';
import 'package:nonstopioassignment/data/models/beer_model.dart';

void main() {
  group('BeerModel', () {
    

    test('should create a BeerModel instance from JSON', () {
      // Arrange
      final Map<String, dynamic> jsonData = {
        'id': 1,
        'name': 'Test Beer',
        'tagline': 'Test Tagline',
        'first_brewed': '01/2023',
        'description': 'Test description',
        'image_url': 'test_image_url.jpg',
        'abv': 5.0,
        'ibu': 20.0,
        'target_fg': 1010,
        'target_og': 1040,
        'ebc': 10,
        'srm': 5,
        'ph': 4.5,
        'attenuation_level': 75.0,
      };

      // Act
      final beerModel = BeerModel.fromJson(jsonData);

      // Assert
      expect(beerModel, isA<BeerModel>());
      expect(beerModel.id, jsonData['id']);
      expect(beerModel.name, jsonData['name']);
      expect(beerModel.tagline, jsonData['tagline']);
      expect(beerModel.firstBrewed, jsonData['first_brewed']);
      expect(beerModel.description, jsonData['description']);
      expect(beerModel.imageUrl, jsonData['image_url']);
      expect(beerModel.abv, jsonData['abv']);
      expect(beerModel.ibu, jsonData['ibu']);
      expect(beerModel.targetFg, jsonData['target_fg']);
      expect(beerModel.targetOg, jsonData['target_og']);
      expect(beerModel.ebc, jsonData['ebc']);
      expect(beerModel.srm, jsonData['srm']);
      expect(beerModel.ph, jsonData['ph']);
      expect(beerModel.attenuationLevel, jsonData['attenuation_level']);
    });
  });
}
