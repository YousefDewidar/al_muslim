import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:al_muslim/features/radio/data/radio_services.dart';
import 'package:flutter/material.dart';

class AllRadioViewBody extends StatefulWidget {
  const AllRadioViewBody({super.key});

  @override
  State<AllRadioViewBody> createState() => _AllRadioViewBodyState();
}

class _AllRadioViewBodyState extends State<AllRadioViewBody> {
  final searchController = TextEditingController();
  List<dynamic> searchedList = [];
  late List<dynamic> allList;

  Widget buildTextFeild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (searcherChar) {
          addSearcherChartoFiltertheList(searcherChar);
        },
        controller: searchController,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          hintText: 'ابحث عن الاذاعه التي ترغب ف الاستماع اليها',
          hintStyle:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
          suffixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          header: 'الاذاعه',
          desc: 'يمكنك الاستماع الي اذاعه القران الكريم لعدد كبير كم القراء',
        ),
        buildTextFeild(),
        FutureBuilder(
            future: RadioServices().getRadioData(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                allList = snapShot.data!;
                return HandelRadioList(
                    searchController: searchController,
                    allList: allList,
                    searchedList: searchedList);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }

  //?search function
  void addSearcherChartoFiltertheList(String searcherChar) {
    searchedList = allList
        .where((radio) => radio.name.toLowerCase().contains(searcherChar))
        .toList();
    setState(() {});
  }
}

class HandelRadioList extends StatelessWidget {
  const HandelRadioList({
    super.key,
    required this.searchController,
    required this.allList,
    required this.searchedList,
  });

  final TextEditingController searchController;
  final List allList;
  final List searchedList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: searchController.text.isEmpty
            ? allList.length
            : searchedList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTitleCard(
            prefixIcon: Icons.radio,
            categorytTitle: searchController.text.isEmpty
                ? allList[index].name
                : searchedList[index].name,
            url: searchController.text.isEmpty
                ? allList[index].url
                : searchedList[index].url,
            pageName: 'radio',
          );
        },
      ),
    );
  }

  edit() async {}
}
