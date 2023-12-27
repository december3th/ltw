//$(document).ready(function () {
//    // Activate tooltip
//    $('[data-toggle="tooltip"]').tooltip();
//
//    // Select/Deselect checkboxes
//    var checkbox = $('table tbody input[type="checkbox"]');
//    $("#selectAll").click(function () {
//        if (this.checked) {
//            checkbox.each(function () {
//                this.checked = true;
//            });
//        } else {
//            checkbox.each(function () {
//                this.checked = false;
//            });
//        }
//    });
//    checkbox.click(function () {
//        if (!this.checked) {
//            $("#selectAll").prop("checked", false);
//        }
//    });
//});


document.querySelector(".category-title").addEventListener("click", () => {
    var cate_block = document.querySelector(".category-show");
    if (cate_block.classList.contains('hidden')) {
        cate_block.classList.remove('hidden');
    } else {
        cate_block.classList.add('hidden');
    }
});