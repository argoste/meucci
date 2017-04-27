var myButton = document.getElementById('myButton');
myButton.addEventListener('click', createParagraph);
function createParagraph() {
  var para = document.createElement('p');
  para.textContent = "another";
  document.body.appendChild(para);
}
