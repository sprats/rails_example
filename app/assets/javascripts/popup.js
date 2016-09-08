$(function () {
    $( "#info_dialog" ).dialog({
        autoOpen: false
    });

    $("#opener").click(function() {
        $("#info_dialog").dialog('open');
    });
});