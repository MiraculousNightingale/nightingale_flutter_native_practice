import 'package:flutter/material.dart';
import 'package:nightingale_flutter_native_practice/models/place.dart';
import 'package:nightingale_flutter_native_practice/providers/great_places.dart';
import 'package:nightingale_flutter_native_practice/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/places_list_item.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (context, value, child) => value.items.isEmpty
                        ? child!
                        : ListView.builder(
                            itemCount: value.items.length,
                            itemBuilder: (context, index) => PlacesListItem(
                              place: value.items[index],
                            ),
                          ),
                    child: Center(
                      child: Text(
                        'Got no places yet, start adding some!',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
