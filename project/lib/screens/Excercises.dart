import 'package:flutter/material.dart';
import 'package:project/providers/exercises_provider.dart';
import 'package:provider/provider.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excercises'),
      ),
      body: FutureBuilder(
          future: context.read<ExercisesProvider>().getExercises(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError || snapshot.data == null) {
              return Center(child: Text(' $snapshot'));
            }
            return Consumer<ExercisesProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.exercisesList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(value.exercisesList[index].title.toString()),
                        subtitle:
                            Text(value.exercisesList[index].file.toString()),
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
