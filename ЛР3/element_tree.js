let $UNFOLDED = false;

function generateSubTree(parentItem, children) {
    if (!children || !children.length) {
        return;
    }

    let list = document.createElement('ul');
    for (node of children) {
        let li = document.createElement('li');
        console.log('Inspecting ' + node.tagName.toLowerCase() + '...');
        li.innerHTML = node.tagName.toLowerCase();
        generateSubTree(li, node.children);
        list.append(li);
    }

    parentItem.append(list);
}

function resize() {
    let overlay = document.getElementById('overlay');
    let content = document.getElementById('overlay-content');

    overlay.classList.toggle('elemen-tree-overlay-active');
    content.style.display = $UNFOLDED ? 'none' : 'block';

    $UNFOLDED = !$UNFOLDED;
}

let div = document.createElement('div');
div.className = 'overlay-content';
div.id = 'overlay-content';
generateSubTree(div, document.children);
console.log(div);

document.getElementById('overlay').append(div);