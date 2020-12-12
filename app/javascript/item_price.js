window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const TaxDom = inputValue * 0.1;
    addTaxDom.innerHTML = Math.floor(TaxDom);
    const addTaxPro = document.getElementById("profit");
    const Profit = inputValue - addTaxDom.innerHTML;
    addTaxPro.innerHTML = Math.floor(Profit);
    console.log(Profit);
  });
});