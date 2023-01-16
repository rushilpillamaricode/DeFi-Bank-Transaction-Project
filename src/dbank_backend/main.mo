import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor DBank{
  stable var currentValue: Float =  300;
  // currentValue:= 500;
  // Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 873216423846283;
  public func toup(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue))
  };

  public func todown(amount: Float){
    let tempvalue: Float = currentValue - amount;
    if(tempvalue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    }
    else{
      Debug.print("Insufficient money in the back to withdraw, Please try again later!");
    }
  };

  public query func checkbalance(): async Float{
    return currentValue;
  };


  public func compound(){
    let currenttime = Time.now();
    let timeelapsedns = currenttime - startTime;
    let timeelapseds = timeelapsedns / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeelapseds));
    startTime := currenttime;
  };
}