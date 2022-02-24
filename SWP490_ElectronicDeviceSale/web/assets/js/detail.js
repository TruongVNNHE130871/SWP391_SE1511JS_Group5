/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function increase() {
    // lay gia tri cua textbox
    var num = document.getElementById("num").value;
    // cong them 1 don vi r gan cho textbox
    document.getElementById("num").value = parseInt(num) + 1;
}
function decrease() {
    var num = document.getElementById("num").value;
    if (parseInt(num) > 1) {
        document.getElementById("num").value = parseInt(num) - 1;
    }
}