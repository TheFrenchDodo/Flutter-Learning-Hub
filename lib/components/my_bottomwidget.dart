import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /*--- return button ---*/
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary, 
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: AppLocalizations.of(context)!.return_button,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    semanticLabel: AppLocalizations.of(context)!.return_button
                  ),
                ),
                const SizedBox(width: 8),
              ]
            ),
          ),
        ]
      )
    );
  }
}
