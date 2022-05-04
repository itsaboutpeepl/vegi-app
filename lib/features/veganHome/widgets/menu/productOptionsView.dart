import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class ProductOptionsView extends StatefulWidget {
  const ProductOptionsView({Key? key}) : super(key: key);

  @override
  _ProductOptionsViewState createState() => _ProductOptionsViewState();
}

class _ProductOptionsViewState extends State<ProductOptionsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        return Column(
          children: viewmodel.menuItem.listOfProductOptions
              .map((e) => ProductOptionsCategoryView(
                    productOptionsCategory: e,
                  ))
              .toList(),
        );
      },
    );
  }
}

class ProductOptionsCategoryView extends StatefulWidget {
  const ProductOptionsCategoryView({Key? key, required this.productOptionsCategory}) : super(key: key);

  final ProductOptionsCategory productOptionsCategory;

  @override
  State<ProductOptionsCategoryView> createState() => _ProductOptionsCategoryViewState();
}

class _ProductOptionsCategoryViewState extends State<ProductOptionsCategoryView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      onInit: (store) {
        store.state.menuItemState.selectedProductOptionsForCategory[widget.productOptionsCategory.categoryID] =
            widget.productOptionsCategory.listOfOptions[0];

        store.dispatch(calculateItemTotalPrice());
      },
      builder: (_, viewmodel) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.productOptionsCategory.name, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 15,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.productOptionsCategory.listOfOptions.length,
              itemBuilder: (_, index) => ListTile(
                onTap: () => setState(() {
                  _selectedIndex = index;
                  viewmodel.selectedOptions[widget.productOptionsCategory.categoryID] =
                      widget.productOptionsCategory.listOfOptions[index];
                }),
                selected: _selectedIndex == index,
                selectedTileColor: themeShade100,
                dense: true,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                leading: Checkbox(
                  activeColor: Colors.grey[800],
                  value: _selectedIndex == index,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = index;
                      viewmodel.selectedOptions[widget.productOptionsCategory.categoryID] =
                          widget.productOptionsCategory.listOfOptions[index];
                    });
                  },
                ),
                title: Text(
                  widget.productOptionsCategory.listOfOptions[index].name,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                trailing: Text(
                  cFPrice(widget.productOptionsCategory.listOfOptions[index].price),
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
              separatorBuilder: (context, index) => Padding(padding: EdgeInsets.only(bottom: 5)),
            )
          ],
        );
      },
    );
  }
}



// List of Product Options Category
// Each List has multiple categories under it. (can be solved by rebuilding for each item in the list)
// Each Category has multiple options under it. 
// You can only choose one option from the multiple options provided for each category.
// Each category needs to have atleast one option selected. (can be solved by default selection)


// ListView.separated(
//           separatorBuilder: (context, index) =>
//               Padding(padding: EdgeInsets.only(bottom: 5)),
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: viewmodel.menuItem.extras.length,
//           itemBuilder: (_, index) => ListTile(
//             dense: true,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             tileColor:
//                 viewmodel.selectedExtras[index] ? themeShade500[100] : null,
//             title: Text(viewmodel.menuItem.extras.keys.elementAt(index)),
//             trailing: Text(
//               cFPrice(viewmodel.menuItem.extras.values.elementAt(index)),
//             ),
//             onTap: () => setState(
//               () {
//                 viewmodel.selectedExtras[index] =
//                     !viewmodel.selectedExtras[index];

//                 viewmodel.selectedExtrasMap.containsKey(
//                         viewmodel.menuItem.extras.keys.elementAt(index))
//                     ? viewmodel.selectedExtrasMap
//                         .remove(viewmodel.menuItem.extras.keys.elementAt(index))
//                     : viewmodel.selectedExtrasMap[
//                             viewmodel.menuItem.extras.keys.elementAt(index)] =
//                         viewmodel.menuItem.extras.values.elementAt(index);
//               },
//             ),
//           ),
//         );