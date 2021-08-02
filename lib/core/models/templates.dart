import 'package:employee_directory/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class Template {
  String name;
  String image;
  Color color;

  Template({
    required this.name,
    required this.image,
    required this.color,
  });
}

List<Template> kTemplateList = [
  Template(
    image: 'thank_you.png',
    name: 'Thank You',
    color: kTemplateBlueColor,
  ),
  Template(
    image: 'amazing.png',
    name: 'Amazing Work',
    color: kTemplateRedColor,
  ),
  Template(
    image: 'make_work_fun.png',
    name: 'Making Working Fun',
    color: kTemplateYellowColor,
  ),
  Template(
    image: 'going_above_beyond.png',
    name: 'Going Above & Beyond',
    color: kTemplateGreenColor,
  ),
  Template(
    image: 'inspiration_leader.png',
    name: 'Inspiration Leader',
    color: kTemplateBlueColor,
  ),
  Template(
    image: 'great_presentation.png',
    name: 'Great Presentation',
    color: kTemplateRedColor,
  ),
  Template(
    image: 'team_player.png',
    name: 'Team Player',
    color: kTemplateYellowColor,
  ),
  Template(
    image: 'outside_the_box.png',
    name: 'Outside The Box Thinker',
    color: kTemplateGreenColor,
  ),
];
