import 'package:dhpversion2/Pages/Branches/components/branches_search.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: "Branches Screen",
      child: BranchesSearch(),
      //title: 'My Branches',
    );
  }
}
