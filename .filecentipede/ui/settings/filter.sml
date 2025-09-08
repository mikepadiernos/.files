EditDialog#dialog_torrent_files_filter
{
    layout:VBoxLayout
    width:400
    height:200
    title-add:"${add}"
    title-edit:"${edit}"
    form:${#dialog_torrent_files_filter}
    buttons:default
    GridLayout
    {
        column:2
        
        "${rule_name}:" LineEdit{
            name:name
            placeholder:"${filter_rule_name_placeholder_}"
        }
        "${rule}:" TextEdit{
            name:rule
            placeholder:"${filter_rule_placeholder_}"
        }
    }
    
}


#torrent_files
{
    text:"${rule}"
    layout:VBoxLayout
    Table#torrent_files_filter
    {
        name:torrent_files
        sortable:true
        stripe:true
        editable:false
        stretch-last-section:true
        selection:rows
        vtype:pairs
        columns-height:26
        columns:{
            {name:name,text:"${rule_name}",width:120}
            {name:rule,text:"${rule}",width:160}
        }
        double-click:$trigger{#act_edit}()
        context-menu:
        {
            Action#act_add{
                text:"${add}"
                icon:"icons/24/add.svg"
            }
            Action#act_edit{
                text:"${edit}"
                icon:"icons/16/edit.svg"
            }
            Action#act_remove{
                text:"${remove}"
                icon:"icons/16/delete.svg"
                trigger:$remove-selected-rows{#torrent_files_filter}()
            }
        }
    }
    
}

#file_names
{
    text:"${file_names}"
    layout:VBoxLayout

    TextEdit{
        name:file_names
        placeholder:"${filter_file_names_placeholder_}"
    }
}

#help
{
    text:"${help}"
    layout:VBoxLayout
    Edit{
        viewonly:true
        "${setting_filter_help_}"
    }
}


Dialog#main
{
    title:"${filter}"
    width:600
    height:400
    layout:VBoxLayout
    
    Tab#tabs
    {
        ${#torrent_files}
        ${#file_names}
        ${#help}
    }
    HBoxLayout
    {
        <==>
        Button#save{
            text:"${save}"
            icon:"icons/16/save.svg"
        }
        Button{
            text:"${cancel}"
            icon:"icons/16/cancel.svg"
            click:$close{#main}()
        }
    }
}  
