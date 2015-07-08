// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//= require bootstrap
//= require bootstrap-table

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function taxCodeFormatter(value, row, index)
{
	val = '';
	
	for (i = 0; i < (11 - value.length); i++)
	{
	    val += '0' + val;
	}
	
	val += value;
	val=val.replace(/\D/g,"")                 //Remove tudo o que não é dígito
	val=val.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o terceiro e o quarto dígitos
	val=val.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o setimo e o oitava dígitos
	val=val.replace(/(\d{3})(\d)/,"$1-$2")   //Coloca ponto entre o decimoprimeiro e o decimosegundo dígitos
	return val;
}

function dateFormatter(value, row, index)
{
	return value.replace(/T(.)+\z/i,"");
}

function dateTimeFormatter(value, row, index)
{ 
	return value.replace("T"," ").replace("Z","").replace(/:(\d)+\z/i,"");
}




