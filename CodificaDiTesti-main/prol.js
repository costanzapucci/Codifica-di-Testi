var testo = document.getElementById('testoTraduzione');
var pulsante = document.getElementById('pulsanteTraduzione');
var testo2 = document.getElementById('testoTraduzione2');
var pulsante2 = document.getElementById('pulsanteTraduzione2');
pulsante.addEventListener('click', function(){
testo.classList.toggle('hidden');
if (pulsante.innerHTML == "-"){
  pulsante.innerHTML = "+";
  }else{
    pulsante.innerHTML = "-";
    }
});


pulsante2.addEventListener('click', function(){
    testo2.classList.toggle('hidden');
    if (pulsante2.innerHTML == "-"){
      pulsante2.innerHTML = "+";
      }else{
        pulsante2.innerHTML = "-";
        }
    });


let choices = document.getElementsByClassName('choice')

for (let choice of choices) {
    choice.firstElementChild.addEventListener('mouseover',
    function() {
        choice.firstElementChild.style.display = 'none'
        choice.lastChild.style.display = 'inline-block'  
    })

    choice.lastChild.addEventListener('click',
    function() {
        choice.lastChild.style.display = 'none'  
        choice.firstElementChild.style.display = 'inline-block'
    })
}

let abbreviazioni = document.getElementsByClassName('abbreviazioni')

for (let abbreviazione of abbreviazioni) {
    let espansione = abbreviazione.nextElementSibling;
    abbreviazione.style.display = 'none'
    espansione.style.textDecorationLine = 'underline'
    espansione.addEventListener('click',
    function() {
        espansione.style.display = 'none'
        abbreviazione.style.display = 'inline-block'  
        abbreviazione.style.textDecorationLine = 'underline';
    })

    abbreviazione.addEventListener('click',
    function() {
        abbreviazione.style.display = 'none' 
        espansione.style.display = 'inline-block'
    })
}





