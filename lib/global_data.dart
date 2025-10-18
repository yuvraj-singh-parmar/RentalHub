import 'dart:io';
//import 'package:flutter/material.dart';

/// This file acts as the global storage for all uploaded or added items.
/// Any screen (like Electronics, Furniture, Flats, or Upload Property)
/// can add new items using: 
///   GlobalData.addItem({...});
///
/// The UploadedItemsScreen automatically reflects updates in real time.

class GlobalData {
  /// 🔹 Master list storing all uploaded items from every category.
  static final List<Map<String, dynamic>> allUploadedItems = [];

  /// 🔹 Add a new item to the global list
  static void addItem(Map<String, dynamic> newItem) {
    allUploadedItems.add(newItem);
  }

  /// 🔹 Add multiple items at once (used for dummy data)
  static void addItems(List<Map<String, dynamic>> items) {
    allUploadedItems.addAll(items);
  }

  /// 🔹 Remove an item
  static void removeItem(Map<String, dynamic> item) {
    allUploadedItems.remove(item);
  }

  /// 🔹 Clear all items (for debugging or logout)
  static void clearAll() {
    allUploadedItems.clear();
  }
}

/// 🔸 Example structure of a global item:
/// {
///   'title': 'Nikon Camera',
///   'price': '650',
///   'location': 'Indore',
///   'image': File('path/to/image.jpg'),   // or AssetImage for dummy data
///   'category': 'Electronics'
/// }

/// Optionally you can pre-load some dummy data at app start.
/// Call this once inside your HomePage initState() if you want demo items.
void preloadDummyData() {
  if (GlobalData.allUploadedItems.isEmpty) {
    GlobalData.addItems([
      {
        'title': 'Modern Flat - 2BHK',
        'price': '15000',
        'location': 'Indore',
        'image': File('assets/furniture/chairs.jpg'), // replace with actual assets
        'category': 'Flats',
      },
      {
        'title': 'Wooden Chair Set',
        'price': '450',
        'location': 'Indore',
        'image': File('assets/furniture/almirah.jpg'),
        'category': 'Furniture',
      },
      {
        'title': 'Drone Camera',
        'price': '900',
        'location': 'Indore',
        'image': File('assets/electronics/DronePic.png'),
        'category': 'Electronics',
      },
    ]);
  }
}
