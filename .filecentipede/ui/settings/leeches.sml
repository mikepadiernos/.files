.operation
{
    min-width:120
    name:operation
    vtype:index
    value:1
    
    "${none}"
    "${disconnect}"
    "${ban_ip}"
}

#page_leeches_anti
{
    text:"${anti_leech}"
    layout:VBoxLayout
    
    HBoxLayout{
        "${leeches_client_names}:"
        <==>
        "${always}:" ComboBox.operation{
            name:operation_always
        }
    }
    TextEdit{
        name:client_names
        placeholder:"${leeches_client_names_placeholder_}"
    }
    
    
    HBoxLayout{
        "${leeches_client_names}:"
        <==>
        "${seeding}:" ComboBox.operation{
            name:operation_seeding
        }
    }
    TextEdit{
        name:client_names2
        placeholder:"${leeches_client_names_placeholder_}"
    }
    
    Label
    {
        wordwrap:true
        css:"color:gray"
        
        "${leeches_description_}"
    }
}
/*
#page_leeches_reversed
{
    text:"${reversing_leech}"
    layout:VBoxLayout
    
    "TODO:"
    "${version} >= 4.0"
    <==>
}
*/
Widget#leeches
{
    layout:{
        type:VBoxLayout
        margin:0
    }
    
    Tab
    {
        ${#page_leeches_anti}
        //${#page_leeches_reversed}
    }
   
}
