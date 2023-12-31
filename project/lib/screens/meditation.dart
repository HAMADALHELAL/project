import 'package:flutter/material.dart';
import 'package:project/providers/meditation_provider.dart';
import 'package:provider/provider.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
      ),
      body: FutureBuilder(
          future: context.read<MeditationProvider>().getMedit(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError || snapshot.data == null) {
              return Center(child: Text('Error loading medits + $snapshot'));
            }
            return Consumer<MeditationProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.meditationList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(value.meditationList[index].title.toString()),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
