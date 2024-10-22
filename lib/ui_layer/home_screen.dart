import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_bloc.dart';
import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_event.dart';
import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_state.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_bloc.dart';
import 'package:stock_trade/ui_layer/watchlist_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: BlocProvider(
          create: (context) => WatchlistBloc(),
          child: const WatchlistScreen(),
        ),
        bottomNavigationBar: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          listener: (context, state) {
            if (state is BottomBarSelectedState) {
              selectedIndex = state.index;
            }
          },
          builder: (context, state) {
            return BottomNavigationBar(
              elevation: 20,
              iconSize: 20,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              unselectedItemColor: Colors.white54,
              selectedItemColor: Theme.of(context).primaryColor,
              backgroundColor: const Color.fromARGB(255, 33, 33, 33),
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (value) {
                context
                    .read<HomeScreenBloc>()
                    .add(BottomBarSelectedEvent(value));
              },
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.bookmark),
                  icon: Icon(Icons.bookmark_border_outlined),
                  label: 'Watchlist',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.shopping_bag_rounded),
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.business_center),
                  icon: Icon(Icons.business_center_outlined),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.insert_chart),
                  icon: Icon(Icons.insert_chart_outlined_outlined),
                  label: 'Movers',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.more_horiz_rounded),
                  icon: Icon(Icons.more_horiz),
                  label: 'More',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
