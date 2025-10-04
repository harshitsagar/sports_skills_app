import 'dart:convert';

import 'package:sports_skills_app/models/skills.dart';

class SkillService {
  // Updated with real sports-related images
  static const String jsonData = '''
  [
    {
      "name": "Dribbling", 
      "level": "Basic", 
      "image": "https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w=400&h=300&fit=crop"
    },
    {
      "name": "Passing", 
      "level": "Basic", 
      "image": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop"
    },
    {
      "name": "Shooting", 
      "level": "Basic", 
      "image": "https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400&h=300&fit=crop"
    },
    {
      "name": "Catching", 
      "level": "Basic", 
      "image": "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=400&h=300&fit=crop"
    },
    {
      "name": "Serving", 
      "level": "Intermediate", 
      "image": "https://images.unsplash.com/photo-1599058917765-a780eda07a3e?w=400&h=300&fit=crop"
    },
    {
      "name": "Vault", 
      "level": "Intermediate", 
      "image": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop"
    },
    {
      "name": "Balance", 
      "level": "Intermediate", 
      "image": "https://images.unsplash.com/photo-1536922246289-88c42f957773?w=400&h=300&fit=crop"
    },
    {
      "name": "Coordination", 
      "level": "Intermediate", 
      "image": "https://images.unsplash.com/photo-1518604666860-9ed391f76460?w=400&h=300&fit=crop"
    },
    {
      "name": "Spiking", 
      "level": "Intermediate", 
      "image": "https://images.unsplash.com/photo-1547347298-4074fc3086f0?w=400&h=300&fit=crop"
    },
    {
      "name": "Agility", 
      "level": "Advanced", 
      "image": "https://images.unsplash.com/photo-1511882150382-421056c89033?w=400&h=300&fit=crop"
    },
    {
      "name": "Precision", 
      "level": "Advanced", 
      "image": "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400&h=300&fit=crop"
    },
    {
      "name": "Power Shot", 
      "level": "Advanced", 
      "image": "https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&h=300&fit=crop"
    },
    {
      "name": "Tactical Awareness", 
      "level": "Advanced", 
      "image": "https://images.unsplash.com/photo-1459865264687-595d652de67e?w=400&h=300&fit=crop"
    },
    {
      "name": "Slam Dunk", 
      "level": "Advanced", 
      "image": "https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400&h=300&fit=crop"
    }
  ]
  ''';

  static Future<List<Skill>> getSkills() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final List<dynamic> jsonList = json.decode(jsonData);
      return jsonList.map((json) => Skill.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load skills: $e');
    }
  }

  static Map<String, List<Skill>> groupSkillsByLevel(List<Skill> skills) {
    final Map<String, List<Skill>> groupedSkills = {};

    // Define the order of levels
    const List<String> levelOrder = ['Basic', 'Intermediate', 'Advanced'];

    // Initialize empty lists for each level
    for (String level in levelOrder) {
      groupedSkills[level] = [];
    }

    // Group skills by level
    for (Skill skill in skills) {
      if (groupedSkills.containsKey(skill.level)) {
        groupedSkills[skill.level]!.add(skill);
      }
    }

    return groupedSkills;
  }
}