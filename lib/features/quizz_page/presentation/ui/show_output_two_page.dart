import 'package:codeware_task/features/quizz_page/presentation/ui/widgets/global_gridview.dart';
import 'package:flutter/material.dart';
import '../fetch_data_function/fetch_data_function.dart';

class ShowOutputTwoPage extends StatefulWidget {
  const ShowOutputTwoPage({super.key});

  @override
  State<ShowOutputTwoPage> createState() => _ShowOutputTwoPageState();
}

class _ShowOutputTwoPageState extends State<ShowOutputTwoPage> {
  TextEditingController searchTextField = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 200), () {
      DataFetchFunction().fetchAllApplicantData(outputType: "outputTwo");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Output One"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextField,
              onChanged: (value) {
                setState(() {
                  DataFetchFunction().filterListById(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      DataFetchFunction.filteredAndroidVersion.clear();
                      searchTextField.clear();
                      DataFetchFunction().filterListById('');
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GlobalGridView(),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: DataFetchFunction.filteredAndroidVersion.length,
          //     itemBuilder: (context, index) {
          //       var item = DataFetchFunction.filteredAndroidVersion[index];
          //       return Card(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //           child: Text("${item.title}"),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
