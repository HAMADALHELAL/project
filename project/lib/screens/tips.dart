import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/tips.dart';
import 'package:project/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () async {
              // Reverse the order of the tipsList
              context.read<TipsProvider>().reverseTipsList();
              setState(() {
                // Refresh the widget tree
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by text or author...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredTips.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(filteredTips[index].text?.toString() ?? ''),
                    subtitle:
                        Text(filteredTips[index].author?.toString() ?? ''),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        TipsData mytips = filteredTips[index];
                        await context.read<TipsProvider>().deleteTip(mytips.id);
                        setState(() {
                          // Refresh the widget tree
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed("addtip");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  List<TipsData> get filteredTips {
    List<TipsData> allTips = context.read<TipsProvider>().tipsList;
    return allTips
        .where((tip) =>
            (tip.text?.toLowerCase() ?? '')
                .contains(_searchQuery.toLowerCase()) ||
            (tip.author?.toLowerCase() ?? '')
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }
}
