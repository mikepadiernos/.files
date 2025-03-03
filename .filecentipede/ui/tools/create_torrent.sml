#config
{
    text:"${config}"
    layout:VBoxLayout
    
    GridLayout
    {
        column:2
        
        "${path}: " HBoxLayout
        {
            spacing:4
            
            LineEdit#path{
                name:path
            }
            ToolButton#open_files{
                icon:"icons/24/add_file.svg"
                icon-size:24
                click:$select-file(${#path})
            }
            ToolButton#open_directory{
                icon:"icons/24/directory.svg"
                icon-size:24
                click:$select-dir(${#path})
            }
        }
    
        
        "${format}:" HBoxLayout
        {
            ComboBox{
                name:format
                vtype:index
                editable:false
                
                "${mix}",V1,V2
            }
            
            "${catalog}:" ComboBox#catalog{
                name:catalog
                vtype:data
                editable:false
                "  ---  "
            }
            <==>
        }
    }
    
            
    GroupBox
    {
        title:"${options}"
        layout:VBoxLayout
        
        CheckBox{
            name:private_torrent
            text:"${private_torrent}"
        }
        CheckBox{
            name:ignore_seeding_limit
            text:"${ignore_seeding_limit}"
            value:true
        }
    }
    
    Label{
        css:"color:gray"
        text:"${create_torrent_notice_}"
    }
    /*
    CheckBox{
        name:force_user_seeding
        text:"${force_user_seeding}"
    }
    */
    <==>
}

#info
{
    text:"${info}"
    layout:VBoxLayout
    
    TextEdit{
        name:comment
        placeholder:"${create_torrent_comment_placeholder_}"
    }
    GridLayout{
        column:2
        "${creator}:" LineEdit{
            name:creator
            placeholder:"${creator}"
        }
    }
  
}

#tracker
{
    text:"${tracker}"
    layout:VBoxLayout
    
    TextEdit{
        name:trackers
        placeholder:"${add_tracker_placeholder_}"
    }
}

#web_seeds
{
    text:"${web_seeds}"
    layout:VBoxLayout
    
    TextEdit{
        name:web_seeds
        placeholder:"${add_web_seed_placeholder_}"
    }
}

Dialog#main
{
    title:"${create_torrent}"
    layout:VBoxLayout
    w:600
    h:400
    Tab
    {
        ${#config}
        ${#info}
        ${#tracker}
        ${#web_seeds}
    }
    HBoxLayout
    {
        CheckBox{
            name:create_task
            text:"${create_task}"
            value:true
        }
        <==>
        Button#btn_create{
            text:"${create_torrent}"
        }
        Button#btn_cancel{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
}


