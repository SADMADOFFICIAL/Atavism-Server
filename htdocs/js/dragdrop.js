$( "span").draggable({ revert: "invalid" });
        
        $( "#box1" ).droppable({
            accept: "#CraftingElements span",
            drop: function( event, ui ) {
                id=ui.draggable.attr('id');
                $('#frm').append('<input type="text" value="'+id+'" id="i'+id+'"><br><br>');
                //or do ajax process get the information and create form element what you want
            }
        });
        
        $( "#CraftingElements" ).droppable({
            accept: "#CraftingElements span",
            drop: function( event, ui ) {
                id=ui.draggable.attr('id');
                $('#frm #i'+id).remove();
            }
        });