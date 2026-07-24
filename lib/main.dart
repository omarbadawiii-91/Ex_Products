import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/presentation/views/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const ExProducts());
}

class ExProducts extends StatelessWidget {
  const ExProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      child: MaterialApp(
        initialRoute: HomePage().homePageRoute,
        routes: {
          HomePage().homePageRoute : (context)=> HomePage(),
        },
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}