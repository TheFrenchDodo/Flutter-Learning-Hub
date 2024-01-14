import 'package:dorian/components/my_bottomwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Entertainment extends StatelessWidget {
  Entertainment({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.entertainment),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
      ],
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
