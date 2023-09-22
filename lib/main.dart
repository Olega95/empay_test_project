import 'package:empay_test_project/core/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EmpayTest());
}

class EmpayTest extends StatelessWidget {
  const EmpayTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Empay Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}
