// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle

//プレビュー機能（新規登録）
$(function(){
	$('#profile-image').on('change', function (e) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#profile-preview").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});

//プレビュー機能（新規投稿）
$(function(){
	$('#post-image').on('change', function (e) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#post-preview").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});

//カレンダーツールチップ
$(function(){
	$('[data-trigger="click').tooltip();
});
