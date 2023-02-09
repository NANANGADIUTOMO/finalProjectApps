import 'package:ewarungapps/mainpage/RegisterPage.dart';
import 'package:ewarungapps/mainpage/riwayat.dart';
import 'package:ewarungapps/mainpage/grafikPage.dart';
import 'package:ewarungapps/mainpage/omsetPage.dart';
import 'package:ewarungapps/mainpage/shoppingPage.dart';
import 'package:ewarungapps/product/detailProduct.dart';
import 'package:go_router/go_router.dart';

import '../mainpage/homePage.dart';
import '../mainpage/loginPage.dart';
import '../mainpage/notaPage.dart';
import '../mainpage/riwayat.dart';
import '../product/productPage.dart';

class NanangRoute {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return LoginPage();
        },
        routes: [
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) {
              return const RegisterPage();
            },
          )
        ]),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: 'akun',
            name: 'akun',
            builder: (context, state) {
              return const AkunPage();
            },
          ),
          GoRoute(
              path: 'product',
              name: 'product',
              builder: (context, state) {
                return ProductPage();
              },
              routes: [
                GoRoute(
                    path: 'shop',
                    name: 'shop',
                    builder: (context, state) {
                      return ShoppingPage(
                        goRouterState: state,
                      );
                    },
                    routes: [
                      GoRoute(
                        name: 'nota',
                        path: 'nota',
                        builder: (context, state) {
                          return NotaPage();
                        },
                      )
                    ]),
                GoRoute(
                  path: 'detailproduct',
                  name: 'detailproduct',
                  builder: (context, state) {
                    return DetailProductPage(
                      goRouterState: state,
                    );
                  },
                ),
              ]),
          GoRoute(
            path: 'omset',
            name: 'omset',
            builder: (context, state) {
              return const omsetPage();
            },
          ),
          GoRoute(
            path: 'grafik',
            name: 'grafik',
            builder: (context, state) {
              return grafikPage();
            },
          )
        ])
  ], initialLocation: '/login', debugLogDiagnostics: true, routerNeglect: true);
}
