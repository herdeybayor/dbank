import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  currentValue := 300;

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  var id = 1234567890;
  // Debug.print(debug_show(id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public query func compoundTime() : async Int {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    Debug.print(debug_show (timeElapsedS));
    return timeElapsedS;
  };

  public func compound() : async Float {
    let currentTime = Time.now();
    let timeElapsedNS = Float.fromInt(currentTime - startTime);
    let timeElapsedS = timeElapsedNS / 100000000;
    let rate = 0.01;
    currentValue := currentValue * ((1 + rate) ** timeElapsedS);
    startTime := currentTime;
    return currentValue;
  };
};
