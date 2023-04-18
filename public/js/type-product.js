(function ($) {
    
    const detail = $("#detail")
    detail.children().each((i, e) => {
        if (i === 0) {
            $(e).show();
        } else {
            $(e).hide();
        }
    });
    
    var type = $("#typeProduct").on("change", () => {

        var type = $("#typeProduct").val();
        var detail = $("#detail");
        let index;

        if (type === "Máy Tính Xách Tay") {
            index = 0
        } else if (type === "Phụ Kiện Máy Tính") {
            index = 1;
        }
        // console.log(detail.children()[index]);
        detail.children().each((i, e) => {
            if (i === index) {
                $(e).show();
            } else {
                $(e).hide();
            }
        }
        );
    });
  })(jQuery);
  