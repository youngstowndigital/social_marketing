// Entry point for the build script in your package.json
//= require jquery3
//= require jquery_ujs
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

window.addEventListener("load", () => {
    $(function() {    
        $('.posts .nav-item .posted').on("click", function() {
            $('.posts .nav-item .active').removeClass('active');
            $('#pending').css("display", "none");
            $('#posted').css("display", "block");
            $(this).addClass('active');
        })
    
        $('.posts .nav-item .scheduled').on("click", function() {
            $('.posts .nav-item .active').removeClass('active');
            $('#posted').css("display", "none");
            $('#pending').css("display", "block");
            $(this).addClass('active');
        })
    });
});
