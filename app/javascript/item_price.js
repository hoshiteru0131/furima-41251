const price = () => {
  const priceInput = document.getElementById('item-price');
  if (priceInput) {
    priceInput.addEventListener('input', function() {
      const price = parseInt(this.value);
      if (!isNaN(price)) {
        const taxRate = 0.1;
        const tax = Math.floor(price * taxRate);
        const profit = price - tax;

        document.getElementById('add-tax-price').textContent = tax;
        document.getElementById('profit').textContent = profit;
      } else {
        document.getElementById('add-tax-price').textContent = 'ー';
        document.getElementById('profit').textContent = 'ー';
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
