import 'package:empay_test_project/core/router.dart';
import 'package:empay_test_project/features/biometric/presentation/bloc/passcode_bloc.dart';
import 'package:empay_test_project/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://95409f2de265288b1fd85294e0c4e21e@o4505913558040576.ingest.sentry.io/4505923751968768';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const EmpayTest()),
  );
}

class EmpayTest extends StatelessWidget {
  const EmpayTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) => PasscodeBloc(),
        ),
        
      ],
      child: MaterialApp.router(
        title: 'Empay Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
