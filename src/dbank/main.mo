import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  var id = 1234567890;

  Debug.print(debug_show("currentValue", currentValue));
  Debug.print(debug_show(id));
}