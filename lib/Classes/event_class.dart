import 'package:flutter/material.dart';

class Event {
  final String title;
  final String time;
  final String description;
  final IconData icon;

  const Event({
    required this.title,
    required this.time,
    required this.description,
    required this.icon,
  });

}