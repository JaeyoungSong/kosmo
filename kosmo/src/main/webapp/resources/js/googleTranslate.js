 $('document').ready(function () {
            $('#google_translate_element').on("click", function () {

                // Change font family and color
                $("iframe").contents().find(".goog-te-menu2-item div, .goog-te-menu2-item:link div, .goog-te-menu2-item:visited div, .goog-te-menu2-item:active div") //, .goog-te-menu2 *
                .css({
                    'color': '#70c745',
                    'background-color': '#fff',
                    'font-family': '"Open Sans",Helvetica,Arial,sans-serif'
                });

                // Change hover effects  #e3e3ff = white
                $("iframe").contents().find(".goog-te-menu2-item div").hover(function () {
                    $(this).css('background-color', '#70c745').find('span.text').css('color', '#fff');
                }, function () {
                    $(this).css('background-color', '#fff').find('span.text').css('color', '#70c745');
                });

                // Change Google's default blue border
                $("iframe").contents().find('.goog-te-menu2').css('border', '1px solid #70c745');

                $("iframe").contents().find('.goog-te-menu2').css('background-color', '');

                // Change the iframe's box shadow
                $(".goog-te-menu-frame").css({
                    '-moz-box-shadow': '0 3px 8px 2px #666666',
                    '-webkit-box-shadow': '0 3px 8px 2px #666',
                    'box-shadow': '0 3px 8px 2px #666'
                });
            });
        });