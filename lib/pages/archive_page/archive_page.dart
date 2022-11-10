import 'package:flutter/material.dart';
import '../../components/components.dart';

class ArchivePage extends StatelessWidget {
  static const id = '/archive';

  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: TDLDrawer(),
      body: CustomScrollView(slivers: [
        TDLSliverAppBar(title: 'Archive'),
        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       childCount: 15,
        //       (ctx, idx) => const TDLTodoTile(),
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
