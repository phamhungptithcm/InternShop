$(function () {
    var pageSize = 10;
    showPage = function (page) {
        $(".nt-pagination").hide();
        $(".nt-pagination").each(function (n) {
            if (n >= pageSize * (page - 1) && n < pageSize * page)
                $(this).show();
        });
    }
    showPage(1);
    
    var totalRows = $("#total").val();
    if(totalRows%4 !=0)
    	var btnPage = totalRows/10+1;
    else 
    	var btnPage = totalRows/10;
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

