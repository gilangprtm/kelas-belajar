// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../widget/constant.dart';
import '../../../widget/mahas_button.dart';
import '../../mahas_config.dart';
import '../../models/api_result_model.dart';
import '../../services/helper.dart';
import '../../services/http_api.dart';
import '../others/shimmer_component.dart';

enum SetupPageState {
  create,
  update,
  detail,
}

class SetupPageController<T> extends ChangeNotifier {
  final String Function(dynamic id)? urlApiGet;
  final String Function()? urlApiPost;
  final String Function(dynamic id)? urlApiPut;
  final String Function(dynamic id)? urlApiDelete;
  final dynamic Function(dynamic e) itemKey;
  final dynamic Function(dynamic e) itemIdAfterSubmit;
  late Function(VoidCallback fn) setState;

  final bool withQuestionBack;
  bool allowDelete;
  bool allowEdit;
  bool allowHistory;
  final bool isFormData;
  final dynamic pageBackParametes;
  bool editable = false;
  String deleteCaption;
  String? errorMessage;
  String deleteDescription;

  Function()? initState;
  Function()? onSubmit;
  Function()? onInit;
  Function()? onHistory;
  Function(ApiResultModel)? onRefreshWhenSubmit;
  Function(ApiResultModel)? onSuccessSubmit;
  Function(dynamic id)? deleteOnTap;
  Future<bool> Function()? backAction;

  dynamic _id;
  bool _backRefresh = false;

  dynamic model;
  bool Function()? onBeforeSubmit;
  Function(dynamic id)? bodyApi;
  Function(dynamic json)? apiToView;
  BuildContext? context;

  bool _isLoading = true;

  SetupPageController({
    this.urlApiGet,
    this.urlApiPost,
    this.urlApiPut,
    this.urlApiDelete,
    required this.itemKey,
    this.allowDelete = true,
    this.allowEdit = true,
    this.allowHistory = false,
    this.withQuestionBack = true,
    this.pageBackParametes,
    required this.itemIdAfterSubmit,
    this.onBeforeSubmit,
    this.bodyApi,
    this.isFormData = false,
    this.apiToView,
    this.onInit,
    this.onHistory,
    this.onSuccessSubmit,
    this.deleteOnTap,
    this.deleteCaption = "Delete",
    this.deleteDescription = "Yakin akan menghapus data ini?",
    this.backAction,
    this.onRefreshWhenSubmit,
    this.errorMessage,
  });

  void _init({
    Function(VoidCallback fn)? setStateX,
    BuildContext? contextX,
  }) async {
    if (setStateX != null) {
      setState = setStateX;
    }
    if (contextX != null) {
      context = contextX;
    }
    setState(() {
      _isLoading = true;
    });
    if (initState != null) {
      await initState!();
    }
    dynamic idX = itemKey(Get.parameters);
    if (onInit != null) {
      await onInit!();
    }
    if (idX != null) {
      await _getModelFromApi(idX);
    } else {
      editable = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future _getModelFromApi(dynamic idX) async {
    setState(() {
      _isLoading = true;
    });
    if (urlApiGet != null) {
      final r = await HttpApi.get(urlApiGet!(idX));
      if (r.success) {
        _id = idX;
        setState(() {
          apiToView!(r.body);
        });
      } else {
        bool noInternet = MahasConfig.hasInternet!;
        if (!noInternet) {
          if (r.statusCode == 404) {
            Helper.dialogWarning("Data tidak ditemukan atau sudah dihapus!");
          } else {
            Helper.dialogWarning(r.message);
          }
        } else {
          Helper.dialogWarning(
              "Gagal memuat data, silahkan cek koneksi internet");
        }
      }
    } else {
      setState(() {
        apiToView!(idX);
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _back() {
    Helper.backOnPress(
      result: _backRefresh,
      editable: editable,
      questionBack: withQuestionBack,
      parametes: pageBackParametes,
    );
  }

  Future<bool> _onWillPop() async {
    _back();
    return false;
  }

  void _popupMenuButtonOnSelected(String v) async {
    if (v == 'Edit') {
      editable = true;
      setState(() {});
    } else if (v == 'Cancel') {
      _init();
      editable = false;
      setState(() {});
    } else if (v == deleteCaption) {
      final r = await Helper.dialogQuestion(
        message: deleteDescription,
        icon: FontAwesomeIcons.trash,
        textConfirm: deleteCaption,
      );
      if (r == true) {
        if (EasyLoading.isShow) return;
        await EasyLoading.show();
        final model = bodyApi != null ? bodyApi!(_id) : null;
        final r = await HttpApi.delete(urlApiDelete!(_id), body: model);
        await EasyLoading.dismiss();
        if (r.success) {
          if (deleteOnTap != null) {
            _id = itemIdAfterSubmit(r.body) ?? _id;
            deleteOnTap!(_id);
          } else {
            _backRefresh = true;
            _back();
          }
        }
        bool noInternet = MahasConfig.hasInternet!;
        if (!noInternet) {
          if (r.statusCode == 404) {
            Helper.dialogWarning("Data tidak ditemukan atau sudah dihapus!");
          } else if (r.message != null) {
            Helper.dialogWarning(r.message);
          }
        } else {
          Helper.dialogWarning(
              "Gagal menghapus data, silahkan cek koneksi internet");
        }
      }
    } else if (v == 'History') {
      onHistory!();
    }
  }

  void submitOnPressed() async {
    if (onSubmit != null) {
      onSubmit!();
    } else {
      if (EasyLoading.isShow) return;
      if (onBeforeSubmit != null) {
        if (!onBeforeSubmit!()) return;
      }
      final model = bodyApi != null ? bodyApi!(_id) : null;

      if (urlApiPost != null || urlApiPut != null) {
        await EasyLoading.show();
        setState(() {
          editable = false;
        });
        ApiResultModel? r;
        if (allowHistory == true) {
          r = await HttpApi.post(
            urlApiPut!(_id),
            body: model,
          );
        } else {
          r = _id == null
              ? await HttpApi.post(
                  urlApiPost!(),
                  body: model,
                )
              : await HttpApi.put(
                  urlApiPut!(_id),
                  body: model,
                );
        }
        if (r.success) {
          if (onRefreshWhenSubmit != null) {
            onRefreshWhenSubmit!(r);
          }
          if (onSuccessSubmit != null) {
            onSuccessSubmit!(r);
          } else {
            _backRefresh = true;
            _id = itemIdAfterSubmit(r.body) ?? _id;
            await _getModelFromApi(_id);
            editable = false;
          }
        } else {
          Helper.dialogWarning(r.message);
          setState(() {
            editable = true;
          });
        }
        await EasyLoading.dismiss();
      }
    }
  }

  SetupPageState get isState {
    if (editable) {
      if (_id == null) {
        return SetupPageState.create;
      } else {
        return SetupPageState.update;
      }
    } else {
      return SetupPageState.detail;
    }
  }
}

class SetupPageComponent extends StatefulWidget {
  final SetupPageController controller;
  final bool childrenPadding;
  final String title;
  final Function children;
  final bool showAppBar;
  final Color appBackgroundColor;
  final dynamic crossAxisAlignmentChildren;
  final Function? titleFunction;
  final List<Widget>? childrenAfterButton;

  const SetupPageComponent({
    super.key,
    required this.title,
    required this.controller,
    this.childrenPadding = true,
    required this.children,
    this.childrenAfterButton,
    this.crossAxisAlignmentChildren = CrossAxisAlignment.center,
    this.titleFunction,
    this.showAppBar = true,
    this.appBackgroundColor = MahasColors.primaryColor,
  });

  @override
  State<SetupPageComponent> createState() => _SetupPageComponentState();
}

class _SetupPageComponentState extends State<SetupPageComponent> {
  @override
  void initState() {
    widget.controller._init(
        setStateX: (fn) {
          if (mounted) {
            setState(fn);
          }
        },
        contextX: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.controller.backAction ?? widget.controller._onWillPop,
      child: Scaffold(
        appBar: !widget.showAppBar
            ? null
            : AppBar(
                backgroundColor: widget.appBackgroundColor,
                iconTheme: const IconThemeData(
                    color: MahasColors.darkSecondaryLightColor),
                title: Text(widget.title),
                centerTitle: true,
                actions: widget.controller._id == null ||
                        (!widget.controller.allowEdit &&
                            !widget.controller.allowDelete)
                    ? []
                    : [
                        PopupMenuButton(
                          onSelected:
                              widget.controller._popupMenuButtonOnSelected,
                          itemBuilder: (BuildContext context) {
                            List<PopupMenuItem<String>> r = [];
                            if (widget.controller.editable) {
                              r.add(const PopupMenuItem(
                                value: 'Cancel',
                                child: Text('Batal'),
                              ));
                            } else {
                              if (widget.controller.allowEdit) {
                                r.add(const PopupMenuItem(
                                  value: 'Edit',
                                  child: Text('Edit'),
                                ));
                              }
                              if (widget.controller.allowDelete) {
                                r.add(PopupMenuItem(
                                  value: widget.controller.deleteCaption,
                                  child: Text(widget.controller.deleteCaption),
                                ));
                              }
                              if (widget.controller.allowHistory &&
                                  widget.controller.onHistory != null) {
                                r.add(const PopupMenuItem(
                                  value: 'History',
                                  child: Text('History'),
                                ));
                              }
                            }
                            return r;
                          },
                        ),
                      ],
              ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: 10, horizontal: widget.childrenPadding ? 10 : 0),
          child: widget.controller._isLoading
              ? const ShimmerComponent()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: widget.crossAxisAlignmentChildren,
                        children: widget.children(),
                      ),
                      Visibility(
                        visible: widget.controller.editable,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: MahasButton(
                            height: 48,
                            isFullWidth: true,
                            text: 'Simpan',
                            onPressed: () {
                              widget.controller.submitOnPressed();
                            },
                            borderRadius: MahasBorderRadius.medium,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.childrenAfterButton != null,
                        child: Column(
                          children: widget.childrenAfterButton ?? [],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
