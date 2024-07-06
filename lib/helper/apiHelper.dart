import 'dart:convert';

import 'package:animal/modal/apiModal.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String api = 'https://api.api-ninjas.com/v1/animals';

  Future<List<Animal>> getAllAnimals({name = 'tiger'}) async {
    List<Animal> allAnimals = [];

    http.Response response = await http.get(Uri.parse('$api?name=$name'),
        headers: {'X-Api-Key': 'EJ3JCu7H1rx0crcFnZhOFQ==IFVqgvKP9s3Aj7cU'});

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      allAnimals = data.map((e) => Animal.fromJson(e)).toList();
    }
    Logger().i(response.statusCode);
    return allAnimals;
  }
}
