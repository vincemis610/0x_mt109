let numeros = [1,2,3,4,5];
let rotaciones = 3;

function leftRotate(numeros, rotaciones) {
    if (numeros.length == 0) { return numeros; }
    if (numeros.length == rotaciones ) { return numeros; }

    let counter = 0;
    let pos = 0;
    let newArray = [];
    for (let i = 0; i < numeros.length; i++) {
        if (counter < rotaciones) {
            newArray.push(numeros[i]);
        } else {
            newArray.splice(pos, 0, numeros[i]);
            pos++;
        }
        counter++;
    }
    return newArray;

}

let resultado = leftRotate(numeros, rotaciones);

console.log(resultado);