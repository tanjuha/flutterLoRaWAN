import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/models/FormValidators.dart';

class ChannelProperties extends StatefulWidget {
  const ChannelProperties({super.key});

  @override
  State<ChannelProperties> createState() => _ChannelPropertiesState();
}

class _ChannelPropertiesState extends State<ChannelProperties>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      width: 165.0,
      // padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '1: °C'),
              Tab(text: '2: %RH'),
            ],
          ),
          // SizedBox(height: 16.0),
          Container(
            height: 200.0,
            width: 140.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Hits',
                      ),
                      validator: (value) {
                        return FormValidators.required(value!)
                            ?? FormValidators.maxLength(value, 4)
                            ?? FormValidators.noSymbols(value)
                            ?? FormValidators.onlyNumbers(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 50,
                            child:  TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Min',
                              ),
                              validator: (value) {
                                return FormValidators.required(value!)
                                    ?? FormValidators.maxLength(value, 4)
                                    ?? FormValidators.noSymbols(value)
                                    ?? FormValidators.onlyNumbers(value);

                              }
                            ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Min',
                            ),
                            validator: (value) {
                              return FormValidators.required(value!)
                                  ?? FormValidators.maxLength(value, 4)
                                  ?? FormValidators.noSymbols(value)
                                  ?? FormValidators.onlyNumbers(value);
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50,
                          child:  TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Hyst',
                            ),
                            validator: (value) {
                              return FormValidators.required(value!)
                                  ?? FormValidators.maxLength(value, 4)
                                  ?? FormValidators.noSymbols(value)
                                  ?? FormValidators.onlyNumbers(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child:  TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Hyst',
                            ),
                            validator: (value) {
                              return FormValidators.required(value!)
                                  ?? FormValidators.maxLength(value, 4)
                                  ?? FormValidators.noSymbols(value)
                                  ?? FormValidators.onlyNumbers(value);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Text('No Data Found!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
