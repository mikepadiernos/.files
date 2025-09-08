Action#act_select
{
    text:"${languages}"
    icon:"icons/24/all.svg"
}

Action#act_open
{
    text:"${open}"
    icon:"icons/24/add_file.svg"
}

Action#act_save
{
    text:"${save}"
    icon:"icons/24/save.svg"
}

Action#act_save_as
{
    text:"${save_as}"
    icon:"icons/24/save_as.svg"
}

Action#act_import
{
    text:"${import}"
    icon:"icons/24/import.svg"
}

Action#translate_files
{
    text:"${translate_files}"
    icon:"icons/24/translate.svg"
}


Dialog#dialog_languages
{
    title:"${languages}"
    w:600
    h:450
    layout:VBoxLayout
    
    HBoxLayout{
        "${filter}:" LineEdit#languages_filter{}
        "${default_lang}(${import}):" ComboBox#languages_default{
            editable:true
        }
    }
    
    Table#languages_list{
        editable:false
        stretch-last-section:true
        selection:row
        columns:{
            {name:name,width:120,text:"${name}"}
            {name:language,text:"${language}"}
            {name:country,text:"${country}"}
        }
    }
    HBoxLayout
    {
        "${path}:"
        PathEdit#languages_path
        {
            mode:dir
        }
        ComboBox#languages_display
        {
            vtype:index
            "${show_all}"
            "${show_existed}"
        }
    }
}

Dialog#main
{
    title:"${translate}"
    icon:"icons/24/translate.svg"
    w:800
    h:600
    layout:VBoxLayout
    
    ToolBar{
        button-style:TextBesideIcon
        icon-size:24
        
        ${#act_select}
        ---
        ${#act_open}
        ${#act_save}
        ${#act_save_as}
        ---
        ${#act_import}
        ---
        ${#translate_files}
    }
    Table#data_list
    {
        editable:true
        numbers:true
        sortable:true
        stretch-last-section:true
        wordwrap:true
        columns-height:26
        columns:{
            {name:key,width:180,text:"${key}"}
            {name:text,text:"${text}"}
        }
        context-menu:{
            Action#act_add{
                text:"${add}"
                icon:"icons/24/add.svg"
            }
            Action#act_remove{
                text:"${remove}"
                icon:"icons/16/delete.svg"
            }
            Action#act_copy{
                text:"${copy}"
                icon:"icons/16/copy.svg"
            }
            /*
            Action#act_paste{
                text:"${paste}"
                icon:"icons/16/paste.svg"
            }
            */
        }
    }
    HBoxLayout
    {
        "${filter}:" ComboBox#data_filter_type{
            "${key}"
            "${text}"
        }
        LineEdit#data_filter{}
    }
}
