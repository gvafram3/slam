import 'package:flutter/material.dart';

class MessageCategory extends StatelessWidget {
  const MessageCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MessageCategoryItem(category: 'Sexual Harassment', count: 56),
          MessageCategoryItem(category: 'Theft', count: 91),
          MessageCategoryItem(category: 'Violence', count: 78),
          MessageCategoryItem(category: 'Health', count: 80),
        ],
      ),
    );
  }
}

class MessageCategoryItem extends StatelessWidget {
  final String category;
  final int count;

  const MessageCategoryItem({
    super.key,
    required this.category,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    );
  }
}
