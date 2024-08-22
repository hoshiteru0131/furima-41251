const pay = () => {
// document.addEventListener('DOMContentLoaded', () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) 
  const elements = payjp.elements();
  const cardNumber = elements.create('cardNumber');
  const cardExpiry = elements.create('cardExpiry');
  const cardCvc = elements.create('cardCvc');

  cardNumber.mount('#number-form');
  cardExpiry.mount('#expiry-form');
  cardCvc.mount('#cvc-form');

  const form = document.getElementById('charge-form');

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    payjp.createToken(cardNumber).then((response) => {
      if (response.error) {
        // alert('カード情報が正しくありません。');
      } else {
        const token = response.id;
        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'token');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);
      }
      form.submit();
    });
  });
};
// });
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
