import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class ProductOptionsView extends StatelessWidget {
  const ProductOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        return Column(
          children: viewmodel.menuItem!.listOfProductOptionCategories
              .map(
                (e) => ProductOptionsCategoryView(
                  productOptionsCategory: e,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class ProductOptionsCategoryView extends StatefulWidget {
  const ProductOptionsCategoryView({
    Key? key,
    required this.productOptionsCategory,
  }) : super(key: key);

  final ProductOptionsCategory productOptionsCategory;

  @override
  State<ProductOptionsCategoryView> createState() =>
      _ProductOptionsCategoryViewState();
}

class _ProductOptionsCategoryViewState
    extends State<ProductOptionsCategoryView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      onInit: (store) {
        store.state.menuItemState.selectedProductOptionsForCategory[widget
            .productOptionsCategory
            .categoryID] = widget.productOptionsCategory.listOfOptions[0];

        store.dispatch(calculateItemTotalPrice());
      },
      builder: (_, viewmodel) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productOptionsCategory.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.productOptionsCategory.listOfOptions.length,
              itemBuilder: (_, index) => ListTile(
                onTap: () => setState(() {
                  _selectedIndex = index;
                  // viewmodel.selectedOptions[
                  //         widget.productOptionsCategory.categoryID] =
                  //     widget.productOptionsCategory.listOfOptions[index];
                  viewmodel.selectProductOption(
                    selectedOptionCategoryId:
                        widget.productOptionsCategory.categoryID,
                    selectedProductOption:
                        widget.productOptionsCategory.listOfOptions[index],
                  );
                  viewmodel.reCalcTotals();
                }),
                selected: _selectedIndex == index,
                selectedTileColor: themeShade100,
                dense: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Checkbox(
                  activeColor: Colors.grey[800],
                  value: _selectedIndex == index,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = index;
                      // viewmodel.selectedOptions[
                      //         widget.productOptionsCategory.categoryID] =
                      //     widget.productOptionsCategory.listOfOptions[index];
                      viewmodel.selectProductOption(
                        selectedOptionCategoryId:
                            widget.productOptionsCategory.categoryID,
                        selectedProductOption:
                            widget.productOptionsCategory.listOfOptions[index],
                      );

                      viewmodel.reCalcTotals();
                    });
                  },
                ),
                title: Text(
                  widget.productOptionsCategory.listOfOptions[index].name,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                subtitle: Text(
                  widget
                      .productOptionsCategory.listOfOptions[index].description,
                ),
                trailing: Text(
                  cFPrice(
                    widget.productOptionsCategory.listOfOptions[index].price,
                  ),
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
            )
          ],
        );
      },
    );
  }
}
