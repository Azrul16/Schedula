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

        final allAnnouncement = snapshot.data?.docs;
        List<Announcements> newAnnouncement = [];

        for (var e in allAnnouncement!) {
          newAnnouncement.add(Announcements.fromJSON(e.data(), e.id));
        }
        return ListView.builder(
          itemCount: allAnnouncement.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return AnnounceItem(
              newAnnouncement[index],
              isStart: index == 0,
              isEnd: index == allAnnouncement.length - 1,
              task: allAnnouncement.length,
            );
          },
        );
      },
    );
  }
}
