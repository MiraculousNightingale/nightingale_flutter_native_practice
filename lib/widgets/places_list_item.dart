import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screens/place_detail_screen.dart';

class PlacesListItem extends StatelessWidget {
  const PlacesListItem({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: theme.colorScheme.background.withOpacity(0.65),
        leading: CircleAvatar(
          backgroundImage: FileImage(place.image),
        ),
        title: Text(
          place.title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        subtitle: Text(
          place.location.address ?? '',
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            PlaceDetailScreen.routeName,
            arguments: place.id,
          );
        },
      ),
    );
  }
}
