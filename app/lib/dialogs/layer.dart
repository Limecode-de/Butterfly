import 'package:butterfly/bloc/document_bloc.dart';
import 'package:butterfly/dialogs/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LayerDialog extends StatelessWidget {
  final String layer;
  final bool popupMenu;
  const LayerDialog({super.key, required this.layer, this.popupMenu = false});

  @override
  Widget build(BuildContext context) {
    if (popupMenu) {
      return PopupMenuButton(
          itemBuilder: (context) => _buildListTiles(context)
              .map((e) => PopupMenuItem(padding: EdgeInsets.zero, child: e))
              .toList());
    }
    return AlertDialog(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PhosphorIcon(PhosphorIcons.light.squaresFour),
          ),
          Text(layer),
        ],
      ),
      content: Column(
          mainAxisSize: MainAxisSize.min, children: _buildListTiles(context)),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context).cancel)),
      ],
    );
  }

  List<Widget> _buildListTiles(BuildContext context) => [
        ListTile(
          title: Text(AppLocalizations.of(context).rename),
          leading: PhosphorIcon(PhosphorIcons.light.textT),
          onTap: () async {
            final bloc = context.read<DocumentBloc>();
            final name = await showDialog<String>(
              context: context,
              builder: (context) => NameDialog(
                value: layer,
              ),
            );
            if (name == null) return;
            bloc.add(LayerRenamed(layer, name));
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context).deleteElements),
          leading: PhosphorIcon(PhosphorIcons.light.trash),
          onTap: () {
            showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Text(AppLocalizations.of(ctx).deleteElements),
                      content:
                          Text(AppLocalizations.of(ctx).deleteElementsConfirm),
                      actions: [
                        TextButton(
                          child: Text(AppLocalizations.of(ctx).no),
                          onPressed: () => Navigator.pop(ctx),
                        ),
                        ElevatedButton(
                          child: Text(AppLocalizations.of(ctx).yes),
                          onPressed: () {
                            Navigator.pop(ctx);
                            context
                                .read<DocumentBloc>()
                                .add(LayerElementsDeleted(layer));
                            Navigator.pop(ctx);
                          },
                        ),
                      ],
                    ));
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context).remove),
          leading: PhosphorIcon(PhosphorIcons.light.x),
          onTap: () {
            context.read<DocumentBloc>().add(LayerRemoved(layer));
            Navigator.pop(context);
          },
        ),
      ];
}
