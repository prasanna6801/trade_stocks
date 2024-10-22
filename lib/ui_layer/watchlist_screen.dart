import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_trade/data_layer/stock_model.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_bloc.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_event.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_state.dart';
import 'package:stock_trade/ui_layer/search_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    context.read<WatchlistBloc>().add(WatchlistLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              automaticallyImplyLeading: false,
              title: const Text(
                "Watchlist",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    color: Colors.white38,
                    icon: const Icon(Icons.push_pin_outlined),
                    onPressed: () {},
                  ),
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TabBar(
                            onTap: (value) {
                              context
                                  .read<WatchlistBloc>()
                                  .add(WatchlistLoadEvent());
                            },
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            controller: tabController,
                            unselectedLabelColor: Colors.white,
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 12,
                            ),
                            labelColor: Theme.of(context).primaryColor,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                            ),
                            indicatorColor: Theme.of(context).primaryColor,
                            tabs: const [
                              Tab(text: "MY STOCKS"),
                              Tab(text: "NIFTY"),
                              Tab(text: "BANKNIFTY"),
                              Tab(text: "SENSEX"),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          icon: const Icon(Icons.view_list_outlined)),
                    )
                  ],
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white30,
                  height: 2,
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RawMaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreen(),
                                  ));
                            },
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 33, 33, 33),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(),
                              ),
                              child: Row(children: [
                                const Icon(Icons.search,
                                    color: Color.fromARGB(255, 160, 157, 157),
                                    size: 22),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    "Search & Add",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 160, 157, 157),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  color: Colors.white30,
                                  height: 25,
                                  width: 1,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.apps,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(
                                  width: 10,
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(Icons.tune_rounded,
                                      color: Theme.of(context).primaryColor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ]),
                            )),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    getStocklist(),
                    getStocklist(),
                    getStocklist(),
                    getStocklist(),
                  ]),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '4 / 50 Stocks',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.mode_edit_outline_outlined,
                              size: 20, color: Theme.of(context).primaryColor),
                          label: const Text(
                            "Edit Watchlist",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 33, 33, 33),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  getStocklist() {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is WatchlistLoadedState) {
          return ListView.builder(
            itemCount: state.stocks.length,
            itemBuilder: (context, index) {
              StockModel stockItem = state.stocks[index];
              return Column(
                children: [
                  getStockItem(
                      stockItem.stockName ?? "",
                      stockItem.shortCode ?? "",
                      stockItem.stockCode.toString(),
                      stockItem.value.toString(),
                      stockItem.growthpercent ?? "",
                      Theme.of(context).primaryColor),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white24,
                    indent: 15,
                    endIndent: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget getStockItem(String stockName, String shortCode, String stockCode,
      String value, String growthpercent, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stockName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    shortCode,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Icon(
                      Icons.business_center_outlined,
                      size: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    stockCode,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                growthpercent,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
