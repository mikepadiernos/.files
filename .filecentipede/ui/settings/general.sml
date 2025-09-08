#page_general
{
    text:"${general}"
    layout:VBoxLayout
    GroupBox#page_general_display
    {
        layout:VBoxLayout
        title:"${display}"
        Label{
            css:"font-style:italic"
            text:"(software restart is needed)"
        }
        GridLayout
        {
            column:4
            
            "${language}:" ComboBox#gen_lang{
                stretch:expand
                vtype:data
                "${auto}"
            }
            "",""
            
            "${fonts}:" ComboBox#gen_fonts{
                stretch:expand
                vtype:data
                "${auto}"
            }
            
            "${font_size}:" SpinBox#gen_font_size{
                stretch:expand
                min:0
                max:64
                value:0
                special-text:"${auto}"
            }
   
        }
    }
    GroupBox#page_general_program
    {
        title:"${program}"
        layout:{
            type:GridLayout
            column:3
        }
        CheckBox#gen_tray_icon{
            text:"${tray_icon}"
            toggle:$enable{#gen_silent_mode}(...)
        }
        CheckBox#gen_autostart{
            text:"${autostart} (windows)"
        }
        CheckBox#gen_watch_clipboard{
            text:"${watch_clipboard}"
        }
        CheckBox#gen_sound_effects{
            text:"${sound_effects}"
        }
        CheckBox#gen_save_window_size{
            text:"${save_window_size}"
        }
        CheckBox#gen_save_window_position{
            text:"${save_window_position}"
        }
        CheckBox#gen_no_refresh_address_dialog{
            text:"${no_refresh_address_dialog}"
        }
        CheckBox#gen_no_completed_dialog{
            text:"${no_completed_dialog}"
        }
        CheckBox#gen_silent_mode{
            enable:false
            text:"${silent_mode}"
        }
    }
    GroupBox
    {
        title:"${options}"
        layout:{
            type:GridLayout
            column:3
        }
        CheckBox{
            name:system_service
            text:"${system_service} (${recommended})"
            css:"color:green"
        }
    }
    GroupBox
    {
        layout:VBoxLayout
        title:"${save}"
        
        GridLayout
        {
            column:3
            
            "${file_exists}: " HBoxLayout{
                ComboBox{
                    enable:false
                    name:file_exists
                    vtype:index
                    "${auto_rename_file}"
                    "${skip}"
                }
                8
                CheckBox{
                    name:save_history_path
                    text:"${max_history_paths}: " 
                    value:true
                    toggle:$enable{#max_history_paths}(...)
                } 
                SpinBox#max_history_paths{
                    min:1
                    max:999
                    name:max_history_paths
                }
                <==>
            } ""  
            
            "${default_save_path}:" PathEdit{
                name:default_save_path
                mode:dir
            },""
     
            "${incomplete_save_path}:" PathEdit#incomplete_save_path{
                enable:false
                name:incomplete_save_path
                mode:dir
            }
            CheckBox{
                enable:false
                name:enable_incomplete_save_path
                toggle:$enable{#incomplete_save_path}(...)
            }
            
            "${cache_save_path}:" PathEdit{
                name:cache_save_path
                mode:dir
                enable:false
                placeholder:"${__workspace__}cache"
            },""
        }

    }
    <==>
} 

#page_general_clipboard
{
    text:"${clipboard}"
    layout:VBoxLayout

    GroupBox
    {
        title:"${type}"
        layout:{
            type:GridLayout
            column:6
        }
        
        CheckBox{
            name:enable_http
            text:"HTTP"
        }
        CheckBox{
            name:enable_https
            text:"HTTPS"
        }
        CheckBox{
            name:enable_ftp
            text:"FTP"
        }
        CheckBox{
            name:enable_ftps
            text:"FTPS"
        }
        CheckBox{
            name:enable_sftp
            text:"SFTP"
        }
        CheckBox{
            name:enable_scp
            text:"SCP"
        }
        CheckBox{
            name:enable_hash
            text:"HASH"
            enable:false
            value:false
        }
        CheckBox{
            name:enable_magnet
            text:"${magnet}"
        }
        CheckBox{
            name:enable_ed2k
            text:"${ed2k}"
        }
        CheckBox{
            name:enable_filec
            text:"filec"
        }
        CheckBox{
            name:enable_fileu
            text:"fileu"
        }
        CheckBox{
            name:enable_thunder
            text:"thunder"
        }
        CheckBox{
            name:enable_flashget
            text:"flashget"
        }
        CheckBox{
            name:enable_qqdl
            text:"qqdl"
        }
    }
        
    "${matches_file_extension}:" TextEdit{
        name:suffixes
    }
}

#page_general_alerts
{
    text:"${alert}"
    layout:VBoxLayout
 
    GridLayout
    {
        column:4
        
        "${delete_task}: " ComboBox#gen_alert_delete_task
        {
            stretch:expand
            size-adjust:content
            vtype:index
            value:0
          
            "${confirm}"
            "${delete_task}"
            "${delete_task_and_file}"
        }
        "${delete_catalog}: " ComboBox#gen_alert_delete_catalog
        {
            stretch:expand
            size-adjust:content
            vtype:index
            value:0
        
            "${confirm}"
            "${delete_catalog_only}"
            "${also_delete_tasks}"
            "${also_tasks_and_files}"
        }
    }
    <==>
}

Tab#general
{
    visible:false
    ${#page_general}
    ${#page_general_clipboard}
    ${#page_general_alerts}
}

