
import 'package:collection/collection.dart';
import 'package:locale_loom_app/res/values/value_t.dart';

// Class for managing frequent searches using a max heap
class FrequentSearch {

  // Priority Queue (Max Heap) to store pairs of frequency and search keyword
  static PriorityQueue<Pair> maxHeap = PriorityQueue<Pair>(
        (Pair p1, Pair p2) {
      return p1.key.compareTo(p2.key);
    },
  );

  // Method to fill the max heap with search frequency data
  static void fillTheHeap(Map<String, int> map) {
    // Iterate through the provided map and add pairs to the max heap
    map.forEach((key, value) {
      print(value);
      maxHeap.add(Pair(value, key));

      // If the heap size exceeds the defined maximum, remove the least frequent element
      if (maxHeap.length > Values.maxHeapSizeValue) {
        maxHeap.removeFirst();
      }
    });
  }

  // Method to retrieve the list of most searched keywords from the max heap
  static List<String> sendValueToList() {
    List<String> list = [];

    // Use a temporary heap in the while loop to retrieve elements in descending order of frequency
    while (maxHeap.isNotEmpty) {
      Pair data = maxHeap.removeFirst();
      list.add(data.data);
    }

    return list;
  }
}

// Pair class to represent a key-value pair with an integer key and a String data
class Pair {
  int key;
  String data;

  // Constructor to initialize the Pair with key and data
  Pair(this.key, this.data);
}
