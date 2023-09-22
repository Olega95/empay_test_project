import 'package:empay_test_project/features/biometric/domain/repositories/passcode_repository_impl.dart';
import 'package:empay_test_project/features/biometric/presentation/screens/passcode_screen.dart';
import 'package:empay_test_project/features/todos/presentation/screens/add_task_screen.dart';
import 'package:empay_test_project/features/todos/presentation/screens/tasks_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// extension AppRouterX on BuildContext {
//   void goLocation(String location, {Object? extra}) => go(
//       '${GoRouter.of(this).routeInformationProvider.value.location!}/$location',
//       extra: extra);
//   void pushLocation(String location, {Object? extra}) => push(
//       '${GoRouter.of(this).routeInformationProvider.value.location!}/$location',
//       extra: extra);
// }

class AppRouter {
  static const root = '/';
  static const passcodeScreen = '/passcodeScreen';
  static const addTask = 'addTask';

  final GoRouter router;

  AppRouter() : router = _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: passcodeScreen,
    routes: [
      GoRoute(
        path: root,
        name: root,
        builder: (context, state) => const TasksScreen(),
        routes: [
          GoRoute(
            path: addTask,
            name: addTask,
            builder: (context, state) => const AddTaskScreen(),
          ),
        ],
      ),
      GoRoute(
        path: passcodeScreen,
        name: passcodeScreen,
        builder: (context, state) => const PasscodeScreen(),
      ),
    ],
  );
}
