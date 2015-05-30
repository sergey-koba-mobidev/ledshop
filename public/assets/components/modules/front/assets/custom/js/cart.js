$(function(){
    $.ajax({
        url: '/cart_link',
        success: function (data) {
            $('#cart-li').html(data);
        }
    });
});