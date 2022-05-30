function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.1).toLocaleString();
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(itemPrice.value * 0.9).toLocaleString();
  });
};

window.addEventListener('load', tax);