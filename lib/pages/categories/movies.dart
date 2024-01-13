import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_application_1/pages/learningscreen.dart';


class Movies extends StatelessWidget {
  Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.movie),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          VideoCategoryButton(
            icon: Icons.movie,
            category: AppLocalizations.of(context)!.movie,
            videoIds: ['IesIsKMjB4Y', 'uzjA5d0QXv8'],
          ),
          SizedBox(height: 16),
          
      ])
    );
  }
}
