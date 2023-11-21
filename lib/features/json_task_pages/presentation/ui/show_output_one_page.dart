import 'package:codeware_task/features/json_task_pages/presentation/ui/widgets/global_gridview.dart';
import 'package:flutter/material.dart';
import '../fetch_data_function/fetch_data_function.dart';

class ShowOutputOne extends StatefulWidget {
  const ShowOutputOne({super.key});

  @override
  State<ShowOutputOne> createState() => _ShowOutputOneState();
}

class _ShowOutputOneState extends State<ShowOutputOne> {
  TextEditingController searchTextField = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 200), () {
      DataFetchFunction().fetchAllApplicantData(outputType: "outputOne");
      setState(() {
        DataFetchFunction.noDataFound = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Output One"),
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
    DataFetchFunction.noDataFound = false;
    DataFetchFunction().filterListById(value);
    }
    else {
      if (DataFetchFunction()
          .filterListById(value)
          .isEmpty) {
        DataFetchFunction.noDataFound = true;
      } else {
        DataFetchFunction.noDataFound = false;
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
                      DataFetchFunction.noDataFound = false;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: DataFetchFunction.noDataFound? const Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(Icons.search, size: 90, color: Colors.black12,),
    Text("No Data Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
    ],
    )
    ) : GlobalGridView(),
          ),

        ],
      ),
    );
  }
}
