import 'package:flutter/material.dart';
import 'package:test/screen_main/widgets/items.dart';
import 'package:test/screen_main/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<String> selectedDairy = [];
  List<String> selectedFruits = [];
  List<String> selectedItems = [];

  String selectedCategory = 'Stock';
  bool category = false;
  bool dairy = false;
  bool fruits = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: buildAppBar(),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
            child: Row(
              children: [
                _buildCategoryList(size),
                _buildFilterOptions(size),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomBar(
        size: size,
        onClearFilters: () => clearFilters(
          setDairy: (value) => setState(() => dairy = value),
          setCategory: (value) => setState(() => category = value),
          setFruits: (value) => setState(() => fruits = value),
          selectedItems: selectedItems,
          selectedDairy: selectedDairy,
          selectedFruits: selectedFruits,
        ),
        onApplyFilters: () {
          applyFilters(
            selectedItems: selectedItems,
            selectedDairy: selectedDairy,
            selectedFruits: selectedFruits,
          );
        },
      ),
    );
  }

  Widget _buildCategoryList(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          right: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      height: size.height,
      width: size.width * .38,
      child: ListView(
        children: [
          _buildListTile('Stock'),
          _buildListTile('Categories'),
          _buildListTile('All Pack'),
        ],
      ),
    );
  }

  Widget _buildFilterOptions(Size size) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedCategory == 'Stock') const ScreenStock(),
            if (selectedCategory == 'Categories') _buildCategoriesFilters(),
            if (selectedCategory == 'All Pack') centerText(size, 'All Pack'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: selectedCategory == title ? Colors.white : Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (selectedCategory == title)
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCheckboxRow('Categories', category, (value) {
          setState(() {
            category = value!;
          });
        }),
        _buildChoiceChips(filterSelections, selectedItems),
        const SizedBox(height: 10),
        buildCheckboxRow('Dairy', dairy, (value) {
          setState(() {
            dairy = value!;
          });
        }),
        _buildChoiceChips(dairyProducts, selectedDairy),
        const SizedBox(height: 10),
        buildCheckboxRow('Fruits, Vegetables & Nuts', fruits, (value) {
          setState(() {
            fruits = value!;
          });
        }),
        _buildChoiceChips(fruitsProducts, selectedFruits),
      ],
    );
  }

  Widget _buildChoiceChips(List<String> items, List<String> selectedList) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: items.map((item) {
        return ChoiceChipWidget(
          item: item,
          isSelected: selectedList.contains(item),
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedList.add(item);
              } else {
                selectedList.remove(item);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
