import 'package:flutter/material.dart';
import 'package:project/providers/music_provider.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('music'),
      ),
      body: FutureBuilder(
          future: context.read<MusicProvider>().getMusic(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError || snapshot.data == null) {
              return Center(child: Text('Error loading medits + $snapshot'));
            }
            return Consumer<MusicProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.musicList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(value.musicList[index].title.toString()),
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
