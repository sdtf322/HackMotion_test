import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_opliska/design/styles.dart';

import '../bloc/home_swing_list_bloc.dart';
import '../bloc/home_swing_list_state.dart';
import 'home_swing_list.dart';
import '../../../design/colors.dart';
import '../../../design/dimensions.dart';

class HomeSwingListPage extends StatelessWidget {
  const HomeSwingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Swing List',
          style: primaryTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor,
        child: BlocBuilder<HomeSwingListBloc, HomeSwingListState>(
          builder: (context, state) {
            if (state is HomeSwingListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeSwingListError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is HomeSwingListLoaded) {
              return HomeSwingList(swings: state.swings);
            }
            return Container(); // Default empty container if none of the states match
          },
        ),
      ),
    );
  }
}
