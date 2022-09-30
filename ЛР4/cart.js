function showTotal(event) {
    let priceTexts = document.getElementsByClassName('price');
    let countBoxes = document.getElementsByClassName('count');
    let totalValue = 0;

    if (priceTexts.length != countBoxes.length) {
        alert('Error: Numer of prices and counts does not match');
        return;
    }

    for (let i = 0; i < priceTexts.length; i++) {
        totalValue += Number(priceTexts[i].innerHTML) * Number(countBoxes[i].firstElementChild.value);
        console.log(Number(priceTexts[i]));
    }

    document.getElementById('total-value').innerHTML = String(totalValue) + '₽';
}

function hoverStart(event) {
    this.style.backgroundColor = '#eee';
}

function hoverEnd(event) {
    this.style.backgroundColor = '#fff';
}

function clickStart(event) {
    this.style.backgroundColor = '#ddd';
    addToCart(this);
}

function clickEnd(event) {
    this.style.backgroundColor = '#eee';
}

function addToCart(item) {
    let cartItems = document.querySelectorAll('.cart-row-item');
    let itemName = item.firstElementChild.innerHTML;
    let itemPrice = Number(item.lastElementChild.innerHTML);
    let flag = false;

    for (item of cartItems) {
        if (item.firstElementChild.innerHTML == itemName) {
            flag = true;
            item.lastElementChild.firstElementChild.value = Number(item.lastElementChild.firstElementChild.value) + 1;
            break;
        }
    }

    if (!flag) {
        let header = document.querySelector('.cart-row-header');
        console.log(header);

        header.insertAdjacentHTML('afterend',
            `<div class="row border-bottom py-1 cart-row-item">
                    <div class="col-6">${itemName}</div>
                    <div class="col-3 price">${itemPrice}</div>
                    <div class="col-3 count"><input type="number" min="0" max="99" step="1" value="1"
                            class="form-control form-control-sm"></div>
                </div>`);
    }
}

function addToTable(event) {
    let tableNames = document.querySelectorAll('tbody>tr>td:first-child');
    let itemName = document.getElementById('name-input').value;
    let itemPrice = Number(document.getElementById('price-input').value);

    if (!itemName || !itemPrice) {
        alert('Заполните все поля корректно');
        return;
    }

    for (item of tableNames) {
        if (item.innerHTML == itemName) {
            alert('Товар с таким названием уже существует');
            return;
        }
    }

    let tbody = document.querySelector('tbody');

    tbody.insertAdjacentHTML('beforeend',
        `<tr>
        <td>${itemName}</td>
        <td>${itemPrice}</td>
    </tr>`);

    refreshTable();
}

function refreshTable() {
    let trows = document.querySelectorAll('tbody>tr');
    for (row of trows) {
        row.addEventListener('mouseover', hoverStart);
        row.addEventListener('mouseout', hoverEnd);
        row.addEventListener('mousedown', clickStart);
        row.addEventListener('mouseup', clickEnd);
    }
}

let countTotalButton = document.getElementById('count-total');
countTotalButton.addEventListener('click', showTotal);
refreshTable();
