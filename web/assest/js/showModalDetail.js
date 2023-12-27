

function showModalDetail(id) {

    //hien detail
    var tmp = '.modal-detail-' + id;
    let modalDetail = document.querySelector(tmp);
    modalDetail.classList.remove('hidden');

    //lay so luong theo size
    var classQuantity = '.quantity-order--content-' + id + ' label';
    var quantity = document.querySelectorAll(classQuantity);

    //trang thai radio theo so luong size
    var classSize = '.size-order--content-' + id + ' input';
    var size = document.querySelectorAll(classSize);
    if (quantity[0].textContent.trim() == '0') {
        size[0].disabled = true;
    } else {
        size[0].disabled = false;
    }
    if (quantity[1].textContent.trim() == '0') {
        size[1].disabled = true;
    } else {
        size[1].disabled = false;
    }
    if (quantity[2].textContent.trim() == '0') {
        size[2].disabled = true;
    } else {
        size[2].disabled = false;
    }
    if (quantity[3].textContent.trim() == '0') {
        size[3].disabled = true;
    } else {
        size[3].disabled = false;
    }
}
function closeDetail(id) {

    var tmp = '.modal-detail-' + id;
    let modalDetail = document.querySelector(tmp);
    modalDetail.classList.add('hidden');


}
//        overlayDetail.addEventListener('click', () => {
//            modalDetail.classList.add('hidden');
//        });
//
//        closeDetail.addEventListener('click', () => {
//            modalDetail.classList.add('hidden');
//        });