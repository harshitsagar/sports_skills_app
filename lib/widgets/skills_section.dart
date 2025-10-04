import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_skills_app/models/skills.dart';
import 'skill_card.dart';

class SkillsSection extends StatelessWidget {
  final String level;
  final List<Skill> skills;
  final Color levelColor;

  const SkillsSection({
    super.key,
    required this.level,
    required this.skills,
    required this.levelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Level header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: levelColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                level,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: levelColor,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: levelColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${skills.length}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: levelColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Horizontal scrollable skills
        SizedBox(
          height: 180.h, // Responsive height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: skills[index]);
            },
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}