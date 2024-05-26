import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_opliska/design/colors.dart';
import 'package:hackmotion_test_opliska/design/dimensions.dart';
import 'package:hackmotion_test_opliska/design/styles.dart';

import '../../data/model/swing.dart';
import '../home/bloc/home_swing_list_bloc.dart';
import '../home/bloc/home_swing_list_event.dart';
import '../home/bloc/home_swing_list_state.dart';
import 'inspection_swing_chart.dart';

class InspectionSwingChartPage extends StatelessWidget {
  final List<Swing> swings;
  final Swing swing;

  const InspectionSwingChartPage({super.key, required this.swings, required this.swing});

  @override
  Widget build(BuildContext context) {
    int currentIndex = swings.indexOf(swing);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<HomeSwingListBloc>().add(DeleteSwing(currentIndex));
            },
          ),
        ],
      ),
      body: BlocListener<HomeSwingListBloc, HomeSwingListState>(
        listener: (context, state) {
          if (state is HomeSwingListLoaded) {
            final updatedSwings = state.swings;
            if (updatedSwings.isEmpty) {
              Navigator.pop(context);
            } else {
              int newIndex = currentIndex >= updatedSwings.length ? updatedSwings.length - 1 : currentIndex;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<HomeSwingListBloc>(context),
                    child: InspectionSwingChartPage(
                      swings: updatedSwings,
                      swing: updatedSwings[newIndex],
                    ),
                  ),
                ),
              );
            }
          }
        },
        child: Builder(
          builder: (context) {
            int currentIndex = swings.indexOf(swing);
            return Container(
              color: backgroundColor,  // Set the background color here
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(padding16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Swing ${currentIndex + 1}',
                          style: primaryTextStyle
                        ),
                      ],
                    ),
                  ),
                  // Add some space between the text and the chart
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(padding8),
                      child: InspectionSwingGraph(swing: swing),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currentIndex > 0) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: BlocProvider.of<HomeSwingListBloc>(context),
                                  child: InspectionSwingChartPage(
                                    swings: swings,
                                    swing: swings[currentIndex - 1],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(padding16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: currentIndex == 0 ? Colors.grey : Colors.black,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Previous',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: currentIndex == 0 ? Colors.grey : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (currentIndex < swings.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: BlocProvider.of<HomeSwingListBloc>(context),
                                  child: InspectionSwingChartPage(
                                    swings: swings,
                                    swing: swings[currentIndex + 1],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(padding16),
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: currentIndex == swings.length - 1
                                        ? Colors.grey
                                        : Colors.black),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward,
                                  color: currentIndex == swings.length - 1
                                      ? Colors.grey
                                      : Colors.black),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
