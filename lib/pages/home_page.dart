import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int? _tabIndex = 0;
  var paramNames = ['Wind Speed', 'Precipitation', 'Visibility'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Icon(
                    Icons.sunny,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.height / 5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text('Wind speed: N/A    Precipitation: N/A'),
                ),
                const Align(
                  alignment: Alignment(-1, 0.0),
                  child: Text(
                    'Hourly Forecast',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    color: Color(0xcc82c4ff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Align(
                          alignment: const Alignment(-0.7, 0.5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 5.0,
                              children: List<Widget>.generate(
                                3,
                                (int index) {
                                  return ChoiceChip(
                                    backgroundColor: Colors.transparent,
                                    disabledColor: Colors.blue,
                                    selectedColor: Colors.red,
                                    label: Text(paramNames[index]),
                                    selected: _tabIndex == index,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _tabIndex = selected ? index : null;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 4.3,
                        decoration: const BoxDecoration(
                          color: Color(0xff85a9ff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text('Weather Bar Chart $_tabIndex'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
