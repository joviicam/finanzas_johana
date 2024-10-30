import 'package:finanzas_johana/modules/home/entities/restaurant.dart';
import 'package:finanzas_johana/modules/home/restaurant_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ListCommentsData extends StatelessWidget {
  const ListCommentsData({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (restaurant.comments.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var comment in restaurant.comments)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                ],
              ),
            const SizedBox(width: 8),
            const Divider(),
          ],
        ),
      ],
    );
  }
}
