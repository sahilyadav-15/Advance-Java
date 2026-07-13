public class LargestInArray {
  public static void main(String[] args) {
    int arr[] = { 42, 23, 53, 58, 22 };

    int highest = arr[0];

    for (int i = 0; i <= arr.length - 1; i++) {
      if (highest < arr[i]) {
        highest = arr[i];
      }
    }

    System.out.println(highest);
  }
}
