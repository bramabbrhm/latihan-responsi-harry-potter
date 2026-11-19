import 'package:flutter/material.dart';
import '../models/character_model.dart';

class CharacterDetailView extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar karakter berukuran besar di bagian atas
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    character.image,
                    width: 220,
                    height: 280,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 220,
                        height: 280,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.person,
                          size: 90,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Card informasi detail karakter
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailTile(
                      icon: Icons.badge_outlined,
                      label: 'Full Name',
                      value: character.fullName,
                    ),
                    const Divider(),
                    _buildDetailTile(
                      icon: Icons.person_outline,
                      label: 'Nickname',
                      value: character.nickname.isNotEmpty
                          ? character.nickname
                          : '-',
                    ),
                    const Divider(),
                    _buildDetailTile(
                      icon: Icons.shield_outlined,
                      label: 'Hogwarts House',
                      value: character.hogwartsHouse.isNotEmpty
                          ? character.hogwartsHouse
                          : '-',
                    ),
                    const Divider(),
                    _buildDetailTile(
                      icon: Icons.movie_creation_outlined,
                      label: 'Interpreted By',
                      value: character.interpretedBy.isNotEmpty
                          ? character.interpretedBy
                          : '-',
                    ),
                    const Divider(),
                    _buildDetailTile(
                      icon: Icons.cake_outlined,
                      label: 'Birthdate',
                      value: character.birthdate.isNotEmpty
                          ? character.birthdate
                          : '-',
                    ),
                    const Divider(),
                    _buildChildrenTile(character.children),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 22),
          const SizedBox(width: 12),
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildrenTile(List<String> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.family_restroom, color: Colors.deepPurple, size: 22),
          const SizedBox(width: 12),
          const SizedBox(
            width: 120,
            child: Text(
              'Children',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: children.isEmpty
                ? const Text('-', style: TextStyle(fontSize: 14))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children
                        .map(
                          (child) => Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Row(
                              children: [
                                const Text('• ', style: TextStyle(fontSize: 14)),
                                Expanded(
                                  child: Text(
                                    child,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
