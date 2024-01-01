import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class AddTip extends StatefulWidget {
  const AddTip({Key? key}) : super(key: key);

  @override
  _AddTipState createState() => _AddTipState();
}

class _AddTipState extends State<AddTip> {
  TextEditingController _titleController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Tip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title of the tip',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context
                    .read<TipsProvider>()
                    .createNewTips(_titleController.text);
                context.pop();
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
