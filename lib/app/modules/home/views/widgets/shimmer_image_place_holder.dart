
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerPlaceholder = Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.white,
  ),
);