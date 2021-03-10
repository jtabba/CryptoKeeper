

percentValue = document.querySelector('.percentage');


function colorChange(percentValue) {
    if (percentValue > 0.00) {
        document.querySelector('.percentage').style.color = 'green';
    } else {
        document.querySelector('.percentage').style.color = 'red';
    } 
}