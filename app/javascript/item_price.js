function price () {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  priceInput.addEventListener('keyup', () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    Profit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
  })
}

window.addEventListener("load", price);