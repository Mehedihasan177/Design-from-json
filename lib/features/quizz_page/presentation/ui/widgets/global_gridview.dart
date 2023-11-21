import 'package:flutter/material.dart';

import '../../fetch_data_function/fetch_data_function.dart';

class GlobalGridView extends StatefulWidget {
  const GlobalGridView({super.key});

  @override
  State<GlobalGridView> createState() => _GlobalGridViewState();
}

class _GlobalGridViewState extends State<GlobalGridView> {
  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    final double itemHeight = (size1.height - kToolbarHeight - 10) / 7;
    final double itemWidth = size1.width / 2;
    return GridView.builder(
      itemCount: DataFetchFunction.filteredAndroidVersion.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemBuilder: (BuildContext context, int index) {
        var item = DataFetchFunction.filteredAndroidVersion[index];
        return Card(
          child: Center(
            child: Text("${item.title}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "RobotoMono"),),
          ),
        );
      },
    );
  }
}
