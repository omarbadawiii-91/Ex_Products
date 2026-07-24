import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/apicall.dart';
import 'package:flutter_application_1/core/utils/theme.dart';
import 'package:flutter_application_1/feature/home_page/presentation/manger/Product_info_manger_cubit/product_info_cubit.dart';
import 'package:flutter_application_1/feature/home_page/presentation/views/home_page.dart';
import 'package:flutter_application_1/feature/product_details/presentation/views/product_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocProvider(
        create: (context) => ProductInfoCubit(Apicall()),
        child: MaterialApp(
          initialRoute: HomePage().homePageRoute,
          routes: {
            HomePage().homePageRoute: (context) => HomePage(),
            ProductDetailsScreen().productScreen: (context) => ProductDetailsScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.lighttheme,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
