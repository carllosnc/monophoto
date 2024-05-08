import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '/pages/pages.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) {
        return const CameraPage();
      },
    ),
    GoRoute(
      path: '/editor',
      builder: (context, state) {
        XFile imageFile = state.extra as XFile;

        return EditorPage(image: imageFile);
      },
    ),
  ],
);
