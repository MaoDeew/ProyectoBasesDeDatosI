function justNumbers(e){
    var keynum = window.event ? window.event.keyCode : e.which;
     if ((keynum == 8) || (keynum == 46))
     return true;  
     return /\d/.test(String.fromCharCode(keynum));
}


function justLetters(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
    patron =/[A-Za-z\s]/; // 4
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}