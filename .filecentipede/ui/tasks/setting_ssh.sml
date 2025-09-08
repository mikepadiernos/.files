VBoxLayout#ssh
{
   
    ComboBox#ssh_uri{
        size-adjust:minimum
    }
    
    GridLayout
    {
        column:6
        
        "${connect_timeout}:" SpinBox{
            name:connect_timeout
            max:120000
            step:1000
            suffix:ms
        }
        
        "${max_retry}:" SpinBox{
            name:max_retry
            min:0
            max:9999
        }
        "${max_connections}:" ComboBox{
            name:max_connections
            vtype:number
            editable:true
            max:32
            1 2 4 8 16 32 64 128
        }
        
        "${speed_limit_download}:" SpinBox{
            name:speed_limit_download
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        "${speed_limit_upload}:" SpinBox{
            name:speed_limit_upload
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        
        "${user}:" LineEdit{
            name:user
        }
        "${password}:" LineEdit{
            type:password
            name:pass
        }
    }
    GridLayout
    {
        column:2
        
        "${file_name}:" HBoxLayout
        {
            LineEdit{
                name:file_name
            }
     
            "${catalog}:"  ComboBox#ssh_catalog{
                name:catalog
                vtype:data
                editable:false
                {text:"  ---  ",data:""}
            }
        }
        
        "${save_path}:" HBoxLayout
        {
            ComboBox#ssh_save_path
            {
                name:save_path
                vtype:text
                editable:true
                stretch:expand
                placeholder:"${save_path_placeholder}"
                items:$filec-paths()
            }
            Button{
                text:"..."
                click: $select-dir("${save_path}",${#ssh_save_path})
            }
        }
        
        "${proxy}:" HBoxLayout
        {
            ComboBox#ssh_proxy{
                name:proxy
                vtype:data
                editable:false
                
                "${no_proxy}"
            }
            ComboBox{
                name:proxy_mode
                editable:false
                enable:false
                vtype:index
                
                "${always}"
                "${if_available}"
                "${round_robin}"
                "${round_robin} - ${connections}"
            }
            <==>
        }
    }
    GridLayout
    {
        column:3

        CheckBox{
            name:ignore_remote_modified
            text:"${ignore_remote_modified}"
        }
        CheckBox{
            name:ignore_server_busy
            text:"${ignore_server_busy}"
        }
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
        }
        CheckBox#ssh_no_task_record{
            name:no_task_record
            text:"${no_task_record}"
        }
    }
    <==>
}
 
 
