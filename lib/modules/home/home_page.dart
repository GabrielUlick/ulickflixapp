import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:app_filmes/modules/favorites/favorites_bindings.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/movies/movies_bindings.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[850],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: context.themeGrey,
            onTap: controller.goToPage,
            currentIndex: controller.pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Filmes',
              ),
              BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heartEmpty),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'Sair',
              ),
            ],
          );
        }),
        body: Navigator(
          initialRoute: '/movies',
          key: Get.nestedKey(HomeController.navigatorKey),
          onGenerateRoute: (settings) {
            if (settings.name == '/movies') {
              return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings(),
              );
            }
            if (settings.name == '/favorites') {
              return GetPageRoute(
                settings: settings,
                page: () => const FavoritesPage(),
                binding: FavoritesBindings(),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}