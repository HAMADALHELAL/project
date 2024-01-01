import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/tips.dart';
import 'package:project/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: FutureBuilder(
        future: context.read<TipsProvider>().getTips(),
        builder: (context, AsyncSnapshot<List<TipsData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('${snapshot.error}'));
          }

          return Consumer<TipsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.tipsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(value.tipsList[index].text.toString()),
                      subtitle: Text(value.tipsList[index].author.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          TipsData mytips = value.tipsList[index];
                          context.read<TipsProvider>().deleteTip(mytips.id);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
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
}
