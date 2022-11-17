import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hairsalon/base/color_data.dart';
import 'package:hairsalon/base/constant.dart';
import 'package:hairsalon/base/widget_utils.dart';

/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool? showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;
  final double flagWidth;
  final Decoration? flagDecoration;
  final Size? size;
  final bool hideSearch;
  final Icon? closeIcon;

  /// Background color of SelectionDialog
  final Color? backgroundColor;

  /// Boxshaow color of SelectionDialog that matches CountryCodePicker barrier color
  final Color? barrierColor;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  SelectionDialog(
    this.elements,
    this.favoriteElements, {
    Key? key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.textStyle,
    this.boxDecoration,
    this.showFlag,
    this.flagDecoration,
    this.flagWidth = 32,
    this.size,
    this.backgroundColor,
    this.barrierColor,
    this.hideSearch = false,
    this.closeIcon,
  })  : this.searchDecoration = searchDecoration.prefixIcon == null
            ? searchDecoration.copyWith(prefixIcon: Icon(Icons.search))
            : searchDecoration,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  late List<CountryCode> filteredElements;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      buildTitleDefaultWidget(context, "Select Country", "", () {
        Constant.backToPrev(context);
      },
          Column(
            children: [
              if (!widget.hideSearch)
                getDefaultTextFiled(context, "Search", searchController,
                    getFontColor(context), _filterElements,
                    withPrefix: true, imgName: "search.svg"),
              widget.favoriteElements.isEmpty
                  ? const DecoratedBox(decoration: BoxDecoration())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...widget.favoriteElements.map(
                          (f) => SimpleDialogOption(
                            child: _buildOption(f),
                            onPressed: () {
                              _selectItem(f);
                            },
                          ),
                        ),
                        // const Divider(),
                      ],
                    ),
              if (filteredElements.isEmpty)
                _buildEmptySearchWidget(context)
              else
                ...filteredElements.map(
                  (e) => SimpleDialogOption(
                    child: _buildOption(e),
                    onPressed: () {
                      _selectItem(e);
                    },
                  ),
                )
            ],
          ));

  Widget _buildOption(CountryCode e) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (widget.showFlag!)
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: widget.flagDecoration,
                    clipBehavior: widget.flagDecoration == null
                        ? Clip.none
                        : Clip.hardEdge,
                    child: Image.asset(
                      e.flagUri!,
                      package: 'country_code_picker',
                      width: widget.flagWidth,
                      height: 24.h,
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: getCustomFont(
                      e.toCountryStringOnly(), 16, getFontColor(context), 1,
                      fontWeight: FontWeight.w500),
                ),
                getCustomFont(e.dialCode ?? "", 16, getFontColor(context), 1,
                    fontWeight: FontWeight.w700)
              ],
            ),
          ),
          getDivider()
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(
      child: Text(CountryLocalizations.of(context)?.translate('no_country') ??
          'No country found'),
    );
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
              e.code!.contains(s) ||
              e.dialCode!.contains(s) ||
              e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CountryCode e) {
    print("getvals--back$e");
    Get.back(result: e);
  }
}
