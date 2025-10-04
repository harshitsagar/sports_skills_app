import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_skills_app/models/skills.dart';
import '../services/skill_service.dart';
import '../widgets/skills_section.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  late Future<Map<String, List<Skill>>> _skillsFuture;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final skills = await SkillService.getSkills();
      final groupedSkills = SkillService.groupSkillsByLevel(skills);
      _skillsFuture = Future.value(groupedSkills);
    } catch (e) {
      _skillsFuture = Future.value({});
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'Basic':
        return Colors.green;
      case 'Intermediate':
        return Colors.orange;
      case 'Advanced':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sports Skills',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[50],
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
        onRefresh: _loadSkills,
        child: FutureBuilder<Map<String, List<Skill>>>(
          future: _skillsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Failed to load skills',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: _loadSkills,
                      child: Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            final groupedSkills = snapshot.data!;

            return ListView(
              children: [
                SizedBox(height: 8.h),
                // Basic Skills
                if (groupedSkills['Basic']?.isNotEmpty ?? false)
                  SkillsSection(
                    level: 'Basic',
                    skills: groupedSkills['Basic']!,
                    levelColor: _getLevelColor('Basic'),
                  ),
                // Intermediate Skills
                if (groupedSkills['Intermediate']?.isNotEmpty ?? false)
                  SkillsSection(
                    level: 'Intermediate',
                    skills: groupedSkills['Intermediate']!,
                    levelColor: _getLevelColor('Intermediate'),
                  ),
                // Advanced Skills
                if (groupedSkills['Advanced']?.isNotEmpty ?? false)
                  SkillsSection(
                    level: 'Advanced',
                    skills: groupedSkills['Advanced']!,
                    levelColor: _getLevelColor('Advanced'),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}