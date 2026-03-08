import 'package:doodle_brain/controllers/TopicSelector/cubit/topic_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doodle_brain/assets/fonts/app_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RadioType {topic,difficulty}

Widget CustomRadio(String label, Color color, bool isSelected, RadioType type,BuildContext context) {
  return GestureDetector(
    onTap: () {
      if(type==RadioType.topic){
        context.read<TopicSelectorCubit>().changeTopic(label);
      }
      else{
        context.read<TopicSelectorCubit>().changeDifficulty(label);
      }
    },
    child: Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isSelected ? color : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF3E2723)
              : Colors.grey.withOpacity(0.5),
          width: isSelected ? 2.5 : 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: AppFonts.titlesFont(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    ),
  );
}
