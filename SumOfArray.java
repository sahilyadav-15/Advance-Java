public class SumOfArray {
  public static void main(String[] args) {

    int arr[] = { 42, 23, 53, 58, 22 };

    int sum = 0;

    for (int i = 0; i <= arr.length - 1; i++) {
      sum += arr[i];
    }

    System.out.println("Sum: " + sum);
  }
}
