import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:al_muslim/features/hadith/presentation/view%20model/hadith_services.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_card.dart';
import 'package:flutter/material.dart';

class ReadingHadithViewBody extends StatefulWidget {
  const ReadingHadithViewBody(
      {super.key, required this.sahehName, required this.title});
  final String sahehName;
  final String title;

  @override
  State<ReadingHadithViewBody> createState() => _ReadingHadithViewBodyState();
}

class _ReadingHadithViewBodyState extends State<ReadingHadithViewBody> {
  bool downloaded = false;

  @override
  void initState() {
    inDatabase();
    super.initState();
  }

  void inDatabase() async {
    downloaded = await StorageService.hasDataInLDB(key: widget.sahehName);
    if (downloaded) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    num hadithListCount = 0;
    return FutureBuilder<List<HadithModel>>(
      future: downloaded
          ? HadithServices().getHadithFromLDB(sahehName: widget.sahehName)
          : HadithServices().getHadithData(sahehName: widget.sahehName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<HadithModel> hadith = snapshot.data!;
          hadithListCount = hadith.length;
          return Column(
            children: [
              CustomAppBar(
                  downloadIcon: downloaded
                      ? Icons.download_done_outlined
                      : Icons.download_for_offline_outlined,
                  hasDownload: true,
                  downloadButt: () {
                    HadithServices()
                        .setHadithInLDB(sahehName: widget.sahehName);
                  },
                  header: widget.title,
                  desc: 'عدد الأحاديث : $hadithListCount'),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: hadith.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HadithCard(
                      hadith: hadith[index],
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.orange),
          );
        }
      },
    );
  }
}
