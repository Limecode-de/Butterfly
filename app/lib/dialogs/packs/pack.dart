import 'package:butterfly_api/butterfly_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'components.dart';
import 'general.dart';
import 'palettes.dart';
import 'styles/view.dart';

class PackDialog extends StatefulWidget {
  final ButterflyPack? pack;

  const PackDialog({super.key, this.pack});

  @override
  State<PackDialog> createState() => _PackDialogState();
}

class _PackDialogState extends State<PackDialog> {
  late ButterflyPack pack;

  @override
  void initState() {
    super.initState();
    pack = widget.pack ??
        ButterflyPack(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
  }

  void _onChanged(ButterflyPack pack) {
    setState(() {
      this.pack = pack.copyWith(updatedAt: DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.pack == null
          ? AppLocalizations.of(context).createPack
          : AppLocalizations.of(context).editPack),
      content: SizedBox(
        width: 600,
        height: 600,
        child: DefaultTabController(
          length: widget.pack == null ? 1 : 4,
          child: Column(
            children: [
              if (widget.pack != null)
                TabBar(
                    isScrollable: true,
                    tabs: <dynamic>[
                      [
                        PhosphorIcons.light.gear,
                        AppLocalizations.of(context).general
                      ],
                      [
                        PhosphorIcons.light.puzzlePiece,
                        AppLocalizations.of(context).components
                      ],
                      [
                        PhosphorIcons.light.pencilCircle,
                        AppLocalizations.of(context).styles
                      ],
                      [
                        PhosphorIcons.light.palette,
                        AppLocalizations.of(context).palettes
                      ]
                    ]
                        .map((e) => Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PhosphorIcon(e[0]),
                                  const SizedBox(width: 8),
                                  Text(e[1]),
                                ],
                              ),
                            ))
                        .toList()),
              const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  children: [
                    GeneralPackView(value: pack, onChanged: _onChanged),
                    if (widget.pack != null) ...[
                      ComponentsPackView(value: pack, onChanged: _onChanged),
                      StylesPackView(value: pack, onChanged: _onChanged),
                      PalettesPackView(value: pack, onChanged: _onChanged),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(pack),
          child: Text(widget.pack == null
              ? AppLocalizations.of(context).create
              : AppLocalizations.of(context).save),
        ),
      ],
    );
  }
}
