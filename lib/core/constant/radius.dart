import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProjectBorders extends BorderRadius {
  const ProjectBorders.oneAll() : super.all(const Radius.circular(1));
  const ProjectBorders.smallAll() : super.all(const Radius.circular(10));
  const ProjectBorders.mediumAll() : super.all(const Radius.circular(16));
}