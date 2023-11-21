import 'package:codeware_task/core/utils/consts/app_assets.dart';
import 'package:codeware_task/features/json_task_pages/presentation/ui/widgets/global_gridview.dart';
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
      setState(() {
        DataFetchFunction.noDataFoundTwo = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Output Two"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextField,
              onChanged: (value) {
                setState(() {
                  if(searchTextField.text.isEmpty && value.isEmpty){
                    DataFetchFunction.noDataFoundTwo = false;
                    DataFetchFunction().filterListById(value);
                  }
                  else {
                    if (DataFetchFunction()
                        .filterListById(value)
                        .isEmpty) {
                      DataFetchFunction.noDataFoundTwo = true;
                    } else {
                      DataFetchFunction.noDataFoundTwo = false;
                      DataFetchFunction().filterListById(value);
                    }
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      DataFetchFunction.filteredAndroidVersion.clear();
                      searchTextField.clear();
                      DataFetchFunction().filterListById('');
                      DataFetchFunction.noDataFoundTwo = false;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: DataFetchFunction.noDataFoundTwo? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 90, color: Colors.black12,),
                    Text("No Data Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                )
            ) :GlobalGridView(),
          ),
        ],
      ),
    );
  }
}
