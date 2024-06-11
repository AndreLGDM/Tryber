import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  final int currentPage;
  final List<int> allowedTransitions;

  const CustomScrollPhysics(
      {super.parent,
      required this.currentPage,
      required this.allowedTransitions});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
        parent: buildParent(ancestor),
        currentPage: currentPage,
        allowedTransitions: allowedTransitions);
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels &&
        !allowedTransitions.contains(currentPage - 1)) {
      return value - position.pixels;
    }

    if (value > position.pixels &&
        !allowedTransitions.contains(currentPage + 1)) {
      return value - position.pixels;
    }
    return super.applyBoundaryConditions(position, value);
  }
}
