import { dbank, dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async function() {
    // console.log("Finished loading");
    update();
});

document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();

    const button = event.target.querySelector("#submit-btn");

    const inputAmount= parseFloat(document.getElementById("input-amount").value);
    const withdrawAmount= parseFloat(document.getElementById("withdraw-amount").value);

    button.setAttribute("disabled", true);

    if (document.getElementById("input-amount").value.length != 0) {
    await dbank_backend.topUp(inputAmount);
    document.getElementById("input-amount").value="";
}else if (document.getElementById("withdraw-amount").value.length != 0) {
    await dbank_backend.withdraw(withdrawAmount);
    document.getElementById("withdraw-amount").value="";
    }

    await dbank_backend.compound();
    
    update();
    
    button.removeAttribute("disabled");    
});

async function update(){
    const currentAmount= await dbank_backend.checkbalance();
    document.getElementById("value").innerText = Math.round(currentAmount*100)/100;
};