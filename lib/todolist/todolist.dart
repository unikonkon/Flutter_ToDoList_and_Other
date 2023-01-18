import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToDoList extends StatelessWidget {
  final List<String> cryptoNames = [
    "Bitcoin",
    "Ethereum",
    "Litecoin",
    "Ripple",
    "Bitcoin Cash",
    "EOS",
    "Binance Coin",
    "Tether",
    "Stellar",
    "Cardano",
    "Atom",
    "Doge",
    "Band",
    "Luna",
    "Zil",
    "OP",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto List"),
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   child: TextField(
          //     // controller: controller,
          //     decoration: InputDecoration(
          //       prefixIcon: const Icon(Icons.search),
          //       hintText: 'Search',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(9),
          //       ),
          //     ),
          //     // onChanged: search,
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: cryptoNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Card(
                    color: Color.fromARGB(255, 207, 215, 221),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.outline),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    child: SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cryptoNames[index],
                            style: TextStyle(fontSize: 25.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
