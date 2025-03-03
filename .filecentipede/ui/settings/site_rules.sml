Action#act_transfer_add
{
    text:"${add}"
    icon:"icons/24/add.svg"
}

Action#act_transfer_edit
{
    text:"${edit}"
    icon:"icons/16/edit.svg"
}

Action#act_transfer_remove
{
    text:"${remove}"
    icon:"icons/16/delete.svg"
}

Action#act_transfer_copy
{
    text:"${copy}"
    icon:"icons/16/copy.svg"
    shortcut:"Ctrl+C"
}

Action#act_transfer_paste
{
    text:"${paste}"
    icon:"icons/16/paste.svg"
    shortcut:"Ctrl+V"
    trigger:{
        $clear{#dialog_paste TextEdit}()
        $exec{#dialog_paste}()
    }
}

Action#act_transfer_import
{
    text:"${import}"
    icon:"icons/16/import.svg"
}

Action#act_transfer_export
{
    text:"${export}"
    icon:"icons/16/export.svg"
}


#sites_transfer
{
    text:"${file_transfer}"
    
    layout:{
        type:VBoxLayout
        spacing:0
        margin:2
    }
    ToolBar
    {
        icon-size:16
        button-style:TextBesideIcon
        
        ${#act_transfer_add}
        ${#act_transfer_edit}
        ${#act_transfer_remove}
        ---
        ${#act_transfer_copy}
        ${#act_transfer_paste}
        /*
        ---
        ${#act_transfer_import}
        ${#act_transfer_export}
        */
    }
    Table#sites
    {
        sortable:true
        editable:false
        stripe:true
        stretch:expand
        stretch-last-section:true
        wordwrap:false
        selection:rows
        columns-height:26
        columns:{
            {name:subtype,text:"${protocol}",width:120}
            {name:name,text:"${name}",width:160}
            {name:host,text:"${host}",width:220}
            {name:port,text:"${port}",width:80}
        }
        double-click:$trigger{#act_transfer_edit}()
        context-menu:{
            ${#act_transfer_add}
            ${#act_transfer_edit}
            ${#act_transfer_remove}
            ---
            ${#act_transfer_copy}
            ${#act_transfer_paste}
        }
    }
}

#help_page
{
    text:"${help}"
    layout:VBoxLayout
    Edit{
        viewonly:true
        
        "${site_rules_help_}"
    }
}

Dialog#dialog_paste
{
    title:"${paste}"
    layout:VBoxLayout
    width:600
    height:300
    
    TextEdit{
        name:text
    }
    HBoxLayout{
        <==>
        Button#paste_rules{
            text:"${OK}"
        }
        Button{
            text:"${cancel}"
            click:$close{#dialog_paste}()
        }
    }
}

Dialog#main
{
    title:"${site_rules}"
    layout:VBoxLayout
    width:700
    height:400
    
    Tab{
        ${#sites_transfer}
        ${#help_page}
    }
}  
 
