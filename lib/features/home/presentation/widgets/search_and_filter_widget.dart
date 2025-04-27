import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apple/features/home/domain/entities/products_entity.dart';
import 'package:apple/features/home/presentation/widgets/product_card.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<DataEntity> allItems;
  double minPrice = 0.0;
  double maxPrice = 2000.0;
  double selectedMinPrice = 0.0;
  double selectedMaxPrice = 2000.0;
  String selectedFilter = 'All';

  CustomSearchDelegate(this.allItems);

  List<String> filters = ['All', 'Price Range'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // Filter Dropdown
      DropdownButton<String>(
        padding: EdgeInsets.only(right: 10.w),
        alignment: Alignment.center,
        underline: const SizedBox.shrink(),
        value: selectedFilter,
        onChanged: (newValue) {
          selectedFilter = newValue!;
          if (selectedFilter == 'Price Range') {
            _showPriceRangeDialog(context);
          } else {
            selectedMinPrice = 0.0;
  selectedMaxPrice = 2000.0;
            showSuggestions(context); // Refresh suggestions for 'All' filter
          }
        },
        items: filters.map((filter) {
          return DropdownMenuItem<String>(
            value: filter,
            child: Text(filter),
          );
        }).toList(),
      ),
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  // Filter items based on query and price range
  List<DataEntity> _applyFilters() {
    List<DataEntity> filtered = allItems.where((item) {
      final matchesQuery = item.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      
      // Filter by price range
      final itemPrice = double.tryParse(item.price?.replaceAll('\$', '') ?? '0') ?? 0.0;
      final matchesPriceRange = itemPrice >= selectedMinPrice && itemPrice <= selectedMaxPrice;
      
      return matchesQuery && matchesPriceRange;
    }).toList();

    return filtered;
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _applyFilters();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.w,
        childAspectRatio: 0.75,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ProductCard(
          data: results[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _applyFilters();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.w,
        childAspectRatio: 0.75,
      ),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ProductCard(
          data: suggestions[index],
        );
      },
    );
  }

  // Show price range dialog
  void _showPriceRangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Price Range'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Min Price: \$${selectedMinPrice.toStringAsFixed(0)}'),
                  Slider(
                    min: minPrice,
                    max: maxPrice,
                    divisions: 10,
                    value: selectedMinPrice,
                    onChanged: (value) {
                      setState(() {
                        selectedMinPrice = value;
                      });
                    },
                  ),
                  Text('Max Price: \$${selectedMaxPrice.toStringAsFixed(0)}'),
                  Slider(
                    min: minPrice,
                    max: maxPrice,
                    divisions: 10,
                    value: selectedMaxPrice,
                    onChanged: (value) {
                      setState(() {
                        selectedMaxPrice = value;
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text('Apply'),
                  onPressed: () {
                    // Apply the filter and close the dialog
                    selectedFilter = 'Price Range';
                    Navigator.pop(context);
                    showSuggestions(context); // Refresh suggestions after applying filter
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
