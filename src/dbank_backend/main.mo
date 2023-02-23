import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // Making a variable persistent
  stable var currentValue: Float = 300;
  // currentValue :=100; 
  let id = 134865797236; 

  stable var startTime= Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

 public func topUp(amount: Float){
    currentValue +=amount; 
    Debug.print(debug_show(currentValue));

}; 
    // topUp();
  public func withdraw(amount : Float){
    let tempValue: Float = currentValue -amount;
    if(tempValue >= 0){
    currentValue -=amount;
    Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Your balance is less than withdrawal")
    }
  };
  public query func checkbalance() : async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedSec = ((currentTime-startTime)/1000000000);
    currentValue := currentValue * (1.00000000001 ** Float.fromInt(timeElapsedSec));
    startTime := currentTime;
  }

  };
