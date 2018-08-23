$(function () {
    var pageSize = 4;
    showPage = function (page) {
        $(".result").hide();
        $(".result").each(function (n) {
            if (n >= pageSize * (page - 1) && n < pageSize * page)
                $(this).show();
        });
    }
    showPage(1);
    
    var totalRows = $("#total").val();
    if(totalRows%4 !=0)
    	var btnPage = totalRows/4+1;
    else 
    	var btnPage = totalRows/4;
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