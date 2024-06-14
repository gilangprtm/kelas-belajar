import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/mahas/models/api_list_resut_model.dart';
import 'package:kelas_belajar/infrastructure/mahas/services/http_api.dart';
import 'package:kelas_belajar/infrastructure/navigation/routes.dart';

import '../../../../domain/model/kelasmodel.dart';
import '../../../../infrastructure/mahas/components/inputs/input_text_component.dart';
import '../../../../infrastructure/mahas/components/others/shimmer_component.dart';
import '../../../../infrastructure/theme/typografi.dart';
import '../../../../infrastructure/widget/constant.dart';
import '../../../../infrastructure/widget/mahas_card.dart';
import '../../../../infrastructure/widget/mahas_snackbar.dart';

class KelasListController extends GetxController {
  final searchCon = InputTextController();
  List<KelasModel> kelasList = [];
  RxInt pageIndex = 0.obs;
  final RxList<Widget> items = <Widget>[].obs;

  @override
  void onInit() {
    searchCon.onEditingComplete = () {
      getAllKelas();
    };
    skeletonList();
    getAllKelas();
    super.onInit();
  }

  void skeletonList() {
    items.addAll(List.generate(10, (index) => buildShimmerItem()).toList());
  }

  void createKelas() {
    Get.toNamed(Routes.KELAS_SETUP);
  }

  Widget buildShimmerItem() {
    return const MahasCustomizableCard(
      borderRadius: MahasBorderRadius.large,
      elevation: 0,
      child: ShimmerComponent(count: 3, marginTop: 8, marginBottom: 8),
    );
  }

  void getAllKelas() async {
    kelasList.clear();
    var request = await HttpApi.get(
        '/api/kelas?pageIndex=${pageIndex.value}&filter=${searchCon.value}');
    ApiResultListModel result = ApiResultListModel.fromJson(request.body);
    if (result.datas != null) {
      kelasList = result.datas!.map((e) => KelasModel.fromDynamic(e)).toList();
      items.value = cardKelas(
        lenght: kelasList.length,
        kelas: kelasList,
      ).toList();
    }
  }

  List<GestureDetector> cardKelas({
    int? lenght,
    List<KelasModel>? kelas,
  }) {
    return List.generate(lenght ?? 0, (index) {
      var item = kelas?[index];
      return GestureDetector(
        onTap: () {
          MahasSnackbar.show(Get.context!, 'Item $index clicked');
        },
        child: MahasCustomizableCard(
          padding: 10,
          borderRadius: MahasBorderRadius.large,
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${item?.tahun ?? ''}",
                    style: MahasTypography.bodyText1.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    item?.semester != null ? 'Semester ${item?.semester}' : '',
                    style: MahasTypography.bodyText1.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                item?.nama ?? '',
                style: MahasTypography.subtitle1.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              Text(
                item?.namaGuru ?? '',
                style: MahasTypography.bodyText2.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      );
    });
  }
}
