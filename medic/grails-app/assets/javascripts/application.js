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










/*
$(document).ready(function() {

    $('#table tbody').on( 'click', 'tr', function ()
    {
        if ( $(this).hasClass('selected') )
        {
            $(this).removeClass('selected');

            $('#btn_edit').prop('href','');
            $('#btn_show').prop('href','');
            $('#btn_delete').prop('href','');

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'appointment')
            {
                $('#btn_add_diagnostic').prop('href', '');
            }
            
            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'diagnostic')
            {
                $('#btn_add_prescription').prop('href', '');
            }

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'patient')
            {
                $('#btn_add_appointment').prop('href', '');
            }

        }
        else
        {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');

            $('#btn_edit').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/edit/'+$(this).find('#id').text());
            $('#btn_show').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/show/'+$(this).find('#id').text());
            $('#btn_delete').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/show/'+$(this).find('#id').text());

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'appointment')
            {
                $('#btn_add_diagnostic').prop('href', '/medic/diagnostic/create/' + $(this).find('#id').text());
            }
            
            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'diagnostic')
            {
                $('#btn_add_prescription').prop('href', '/medic/prescription/create/' + $(this).find('#id').text());
            }

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'patient')
            {
                $('#btn_add_appointment').prop('href', '/medic/appointment/create/' + $(this).find('#id').text());
            }
        }
    } );

} );*/


/*
$(document).ready(function() {

    var table = $('#table').dataTable({
        "lengthMenu": [[3, 10, 25, 50, -1], [3, 10, 25, 50, "All"]],
        "language": {
            "lengthMenu": "Display _MENU_ records per page",
            "zeroRecords": "Nothing found - sorry",
            "info": "Showing page _PAGE_ of _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)"
        }
    } );


    $('#table tbody').on( 'click', 'tr', function ()
    {
        if ( $(this).hasClass('selected') )
        {
            $(this).removeClass('selected');

            $('#btn_edit').prop('href','');
            $('#btn_show').prop('href','');
            $('#btn_delete').prop('href','');

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'appointment')
            {
                $('#btn_add_diagnostic').prop('href', '');
            }
            
            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'diagnostic')
            {
                $('#btn_add_prescription').prop('href', '');
            }

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'patient')
            {
                $('#btn_add_appointment').prop('href', '');
            }

        }
        else
        {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');

            $('#btn_edit').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/edit/'+$(this).find('#id').text());
            $('#btn_show').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/show/'+$(this).find('#id').text());
            $('#btn_delete').prop('href','/medic/' + $(document).find('#entity_name').text().toLocaleLowerCase() + '/show/'+$(this).find('#id').text());

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'appointment')
            {
                $('#btn_add_diagnostic').prop('href', '/medic/diagnostic/create/' + $(this).find('#id').text());
            }
            
            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'diagnostic')
            {
                $('#btn_add_prescription').prop('href', '/medic/prescription/create/' + $(this).find('#id').text());
            }

            if ($(document).find('#entity_name').text().toLocaleLowerCase() == 'patient')
            {
                $('#btn_add_appointment').prop('href', '/medic/appointment/create/' + $(this).find('#id').text());
            }
        }
    } );

} );*/


/*
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
*/




