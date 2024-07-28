import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedula/announsmentScreen/announce_item.dart';
import 'package:schedula/announsmentScreen/announce_model.dart';

class AnnounceList extends StatelessWidget {
  const AnnounceList({super.key, required selectedAnnounce});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('announcements').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final allClasses = snapshot.data?.docs;
        return ListView.builder(
          itemCount: allClasses?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final newAnnounce =
                Announcements.fromJSON(allClasses![index].data());

            return AnnounceItem(
              announceItem: newAnnounce,
            );
          },
        );
      },
    );
  }
}
