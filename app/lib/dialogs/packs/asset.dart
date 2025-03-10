import 'package:butterfly/cubits/settings.dart';
import 'package:butterfly_api/butterfly_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../bloc/document_bloc.dart';
import 'pack.dart';

class AssetDialog extends StatelessWidget {
  final PackAssetLocation? value;

  const AssetDialog({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    String? pack = value?.pack;
    String name = value?.name ?? '';
    final bloc = context.read<DocumentBloc>();
    return BlocBuilder<DocumentBloc, DocumentState>(builder: (context, state) {
      if (state is! DocumentLoaded) return const SizedBox();
      final document = state.data;
      final packs = document.getPacks();
      pack ??= packs.firstOrNull;
      return AlertDialog(
        title: Text(
          value == null
              ? AppLocalizations.of(context).addAsset
              : AppLocalizations.of(context).editAsset,
        ),
        scrollable: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  child: DropdownMenu<String>(
                    label: Text(AppLocalizations.of(context).pack),
                    key: UniqueKey(),
                    dropdownMenuEntries: packs
                        .map(
                          (e) => DropdownMenuEntry<String>(
                            value: e,
                            label: e,
                          ),
                        )
                        .toList(),
                    onSelected: (value) {
                      pack = value;
                    },
                    initialSelection: pack,
                    expandedInsets: const EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const PhosphorIcon(PhosphorIconsLight.plusCircle),
                  onPressed: () async {
                    final pack = await showDialog<NoteData>(
                      context: context,
                      builder: (context) => const PackDialog(),
                    );
                    if (pack == null) return;
                    bloc.add(PackAdded(pack));
                  },
                  tooltip: AppLocalizations.of(context).createPack,
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).name,
                filled: true,
              ),
              initialValue: name,
              onChanged: (value) {
                name = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (pack == null) return;
              Navigator.of(context).pop(PackAssetLocation(
                pack!,
                name,
              ));
            },
            child: Text(AppLocalizations.of(context).ok),
          ),
        ],
      );
    });
  }
}

Future<void> addToPack(
  BuildContext context,
  DocumentBloc bloc,
  SettingsCubit settingsCubit,
  List<PadElement> elements,
  Rect rect,
) async {
  final state = bloc.state;
  if (state is! DocumentLoadSuccess) return;
  final document = state.data;
  final result = await showDialog<PackAssetLocation>(
    context: context,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: settingsCubit),
        BlocProvider.value(value: bloc),
      ],
      child: const AssetDialog(),
    ),
  );
  if (result == null) return;
  var pack = document.getPack(result.pack);
  if (pack == null) return;
  final screenshot = await state.currentIndexCubit.render(
    state.data,
    state.page,
    state.info,
    width: rect.width,
    height: rect.height,
    renderBackground: true,
    x: rect.left,
    y: rect.top,
    quality: kThumbnailWidth / rect.width,
  );
  String? thumbnailUri;
  if (screenshot != null) {
    thumbnailUri =
        Uri.dataFromBytes(screenshot.buffer.asUint8List()).toString();
  }
  pack = pack.setComponent(ButterflyComponent(
    name: result.name,
    elements: elements,
    thumbnail: thumbnailUri,
  ));
  bloc.add(PackUpdated(result.pack, pack));
}
