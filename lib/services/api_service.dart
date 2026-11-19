import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';
import '../models/spell_model.dart';

class ApiService {
  static const String baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => CharacterModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load characters: ${response.statusCode}');
    }
  }

  Future<List<SpellModel>> fetchSpells() async {
    final response = await http.get(Uri.parse('$baseUrl/spells'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => SpellModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load spells: ${response.statusCode}');
    }
  }
}
