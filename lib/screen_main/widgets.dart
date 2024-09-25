import 'package:flutter/material.dart';
bool isSelected1 = false;
bool isSelected2 = false;
class ScreenStock extends StatefulWidget {
  const ScreenStock({
    super.key,
  });

  @override
  State<ScreenStock> createState() => _ScreenStockState();
}



class _ScreenStockState extends State<ScreenStock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isSelected1,
              onChanged: (value) {
                setState(() {
                  isSelected1 = !isSelected1;
                });
              },
            ),
            const Text('Newest')
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isSelected2,
              onChanged: (value) {
                setState(() {
                  isSelected2 = !isSelected2;
                });
              },
            ),
            const Text('Oldest')
          ],
        )
      ],
    );
  }
}

class ScreenCategories extends StatefulWidget {
  const ScreenCategories({super.key});

  @override
  State<ScreenCategories> createState() => _ScreenCategoriesState();
}

class _ScreenCategoriesState extends State<ScreenCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
    );
  }
}
class ChoiceChipWidget extends StatelessWidget {
  final String item;
  final bool isSelected;
  final Function(bool) onSelected;

  const ChoiceChipWidget({
    required this.item,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected(!isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(
          item,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
  Widget centerText(Size size, String text) {
    return SizedBox(
      height: size.height * .7,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
   Widget buildAppBar() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        const Text(
          'Filters',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
   Widget buildCheckboxRow(
      String title, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      ],
    );
  }


class BottomBar extends StatelessWidget {
  final Size size;
  final VoidCallback onClearFilters;
  final VoidCallback onApplyFilters;

  const BottomBar({
    required this.size,
    required this.onClearFilters,
    required this.onApplyFilters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onClearFilters,
              child: const Text(
                'Clear Filter',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(
              minWidth: 130,
              color: Colors.blue,
              height: 40,
              onPressed: onApplyFilters,
              child: const Text(
                'Apply',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double minWidth;
  final double height;
  final double fontSize;

  const ReusableButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.minWidth = 130,
    this.height = 40,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      color: color,
      height: height,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
