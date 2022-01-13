// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require jquery_ujs
//= turbolinks
//= require_tree .


// $(document).ready(function(){
// 	$("button").click(function(){
// 		$.ajax({
// 			url: "/posts/" +this.parentElement.id+ "/comments/" +this.id,
// 			type: "DELETE",
// 			success: function(r){
				
// 			}
// 		})
// 	});
// });

$(function(){

	var intervalId;
	setTimer();

	function setTimer() {
		intervalId = setInterval(autoClick, 2000);
	}

	function autoClick() {
		$(".slide").children("a.next").click();
	}

	function changeImages($click) {
		//console.log($click)
		var $current = $click.siblings(".container").children(".current");
		var $new;
		var findSelector = "";

		if($click.hasClass("next")) {
			$new = $current.next();
			findSelector = ":first-child";
		}
		else {
			$new = $current.prev();
			findSelector = ":last-child";
		}

		if($new.length == 0) {
			$new = $current.siblings(findSelector);
		}
		$current.removeClass("current");
		$new.addClass("current");
		setTimer();
	}

	$(".slide").on("click", "> a", function(event){
		event.preventDefault();
		clearInterval(intervalId);
		changeImages($(this));
	})

});

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

