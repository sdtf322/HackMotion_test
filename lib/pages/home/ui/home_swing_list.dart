import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_opliska/design/dimensions.dart';

import '../../../data/model/swing.dart';
import '../../inspection/inspection_swing_chart_page.dart';
import '../bloc/home_swing_list_bloc.dart';
import 'home_swing_list_item.dart';



class HomeSwingList extends StatelessWidget {
  final List<Swing> swings;

  const HomeSwingList({super.key, required this.swings});

  @override
  Widget build(BuildContext context) {
    if (swings.isEmpty) {
      return const Center(child: Text('No swings found :('));
    } else {
      return ListView.separated(
        padding: const EdgeInsets.only(left: padding16, right: padding16, top: padding16),
        itemBuilder: (context, index) {
          return HomeSwingListItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<HomeSwingListBloc>(context),
                    child: InspectionSwingChartPage(swings: swings, swing: swings[index]),
                  ),
                ),
              );
            },
            swingName: 'Swing ${index + 1}',
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: swings.length,
      );
    }
  }
}
