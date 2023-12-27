function Cart(id) {
    var classSize = '.size-order--content-' + id + ' input';
    var size = document.querySelectorAll(classSize);
    var classBorderSize = '.size-order--content-' +id;
    let borderSize = document.querySelector(classBorderSize);
    
    var classAction = '.modal-body--buy__form-' + id;
    let Method = document.querySelector(classAction);
    
    var classSizeBuy = '.sizeProduct-' +id;
    let sizeProduct = document.querySelector(classSizeBuy);
    
    var classButtonBuy  = '.modal-body--buy-' +id +' button';
    let buttonBuy = document.querySelector(classButtonBuy);

    let valueSize = [];
    if (size.length > 0) {
        for (var item of size) {
            if (item.checked) {
                sizeProduct.value = item.value;
                valueSize.push(item.value);
            }

        }
    }
//    console.log(sizeProduct.value);
    if (valueSize.length === 0) {
        buttonBuy.type = "button";
        borderSize.style.border = "3px solid red";
        Method.action = "";
    } else {
        buttonBuy.type = "submit";
        borderSize.style.border = "none";
        Method.action = "cartcontrol";
    }

}
