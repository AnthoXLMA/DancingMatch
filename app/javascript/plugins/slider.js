var slide = new Array("aditya-ali-SzI4No8rQ14-unsplash.jpg", "gift-habeshaw-Etxf65FaTrs-unsplash.jpg", "michael-afonso-z8Tul255kGg-unsplash.jpg", "skye-studios-L6zXAJD01Ak-unsplash.jpg");
var numero = 0;

const initDiapo = document.querySelector("slider");

function ChangeSlide(sens) {
    numero = numero + sens;
    if (numero < 0)
        numero = slide.length - 1;
    if (numero > slide.length - 1)
        numero = 0;
    document.getElementbyId("slide").src = slide[numero];
  }

export { ChangeSlide } ;
