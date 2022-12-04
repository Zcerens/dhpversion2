import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

import 'components/pageTransition_form.dart';

class PageTransitionScreen extends StatefulWidget {
  const PageTransitionScreen({super.key});

  @override
  State<PageTransitionScreen> createState() => _PageTransitionScreenState();
}

class _PageTransitionScreenState extends State<PageTransitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: "Digital Health Platform",
      child: PageTransition(),
    );
  }
}
