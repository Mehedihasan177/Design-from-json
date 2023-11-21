import 'package:codeware_task/core/utils/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/routes/router.dart';
import '../../../../core/utils/consts/app_assets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppAssets.logo, height: 200, width:  200,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {
                      RouteGenerator.pushNamed(context, Routes.showOutputOne);
                    },
                    child: const Text("Output One"),
                  ),
                  10.ph,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {
                      RouteGenerator.pushNamed(context, Routes.showOutputTwo);
                    },
                    child: const Text("Output Two"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
