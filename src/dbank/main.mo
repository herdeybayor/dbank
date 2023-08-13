import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  var id = 1234567890;

  Debug.print(debug_show("Initial Value", currentValue));
  
  public func topUp() {
    currentValue += 1;
    Debug.print(debug_show(currentValue));
  };

  // topUp();
}