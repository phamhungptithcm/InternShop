$(function () {
    var pageSize = 8;
    showPage = function (page) {
        $(".contentPage").hide();
        $(".contentPage").each(function (n) {
            if (n >= pageSize * (page - 1) && n < pageSize * page)
                $(this).show();
        });
    }
    showPage(1);
    
    var totalRows = $("#total").val();
    if(totalRows%8 !=0)
    	var btnPage = totalRows/8+1;
    else 
    	var btnPage = totalRows/8;
    var iTotalPages = Math.ceil(totalRows / pageSize);

    var obj = $('#pagination').twbsPagination({
        totalPages: iTotalPages,
        visiblePages: btnPage,
        onPageClick: function (event, page) {
            console.info(page);
            showPage(page);
        }
    });
    console.info(obj.data());
}); 