const rotate = require('../task');

describe('Rotar numeros n veces', () => {
    let numeros = [1,2,3,4,5];
    
    test('Rotar 0 numeros del arreglo', () => {
        expect(leftRotate(numeros, 0)).toEqual([1,2,3,4,5]);
    });
    test('Rotar 1 numeros del arreglo', () => {
        expect(leftRotate(numeros, 1)).toEqual([2,3,4,5,1]);
    });
    test('Rotar 2 numeros del arreglo', () => {
        expect(leftRotate(numeros, 2)).toEqual([3,4,5,1,2]);
    });
    test('Rotar 3 numeros del arreglo', () => {
        expect(leftRotate(numeros, 3)).toEqual([4,5,1,2,3]);
    });
    test('Rotar 4 numeros del arreglo', () => {
        expect(leftRotate(numeros, 4)).toEqual([5,1,2,3,4]);
    });
    test('Rotar 5 numeros del arreglo', () => {
        expect(leftRotate(numeros, 5)).toEqual([1,2,3,4,5]);
    });
})