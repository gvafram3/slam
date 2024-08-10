import 'package:flutter/material.dart';

import '../bottom_navigation_bar/bottom_nav_bar.dart';
import '../pages/chat_screen.dart';
import '../bottom_navigation_bar/welcome_page.dart';

class ReportDialog extends StatelessWidget {
  final TextEditingController _reportController = TextEditingController();

  ReportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyBottomNavBar()));
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Text(
              'All reports made are recorded. You may be fined if you make a false report. Thank You.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Report Category',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              items: const [
                DropdownMenuItem(value: 'Category1', child: Text('Category 1')),
                DropdownMenuItem(value: 'Category2', child: Text('Category 2')),
                DropdownMenuItem(value: 'Category3', child: Text('Category 3')),
              ],
              onChanged: (value) {},
              hint: const Text('Report Category'),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Report Message',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reportController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyBottomNavBar()));
                  },
                  child: const Text('Cancel report'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                  },
                  child: const Text('Send Report'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
