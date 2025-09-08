#page_ssh_task
{
    text:"${task}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        layout:{
            type:GridLayout
            column:4
        }
        
         "${method}:" ComboBox{
            name:method
            editable:false
            vtype:text
            current:0
            
            sftp
            //scp
        }
        
        "${connect_timeout}:" SpinBox{
            name:connect_timeout
            value:5000
            min:10
            max:120000
            step:1000
            suffix:ms
        }
        
        "${max_connections}:" ComboBox{
            name:max_connections
            vtype:number
            editable:true
            value:8
            1 2 4 8 16 32 64 128 256 512
        }
        
        "${max_retry}:" SpinBox{
            name:max_retry
            min:0
            max:9999
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
            name:pass
            type:password
        }
        
    }
    GroupBox
    {
        title:"${attributes}"
        layout:HBoxLayout
        
        HBoxLayout
        {
            "${last_modified_time}: " ComboBox{
                name:attr_last_modified
        
                vtype:index
                "${local}"
                "${remote}"
            }
            <==>
        }
        HBoxLayout
        {
            "${parallel}(${connections}): " ComboBox{
                name:parallel
    
                vtype:index
                "${smooth}"
                "${fastest}"
            }
            <==>
        }
        <==>
    }
    GroupBox
    {
        title:"${behavior}"
        layout:{
            type:GridLayout
            column:3
        }
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
            value:true
        }
        CheckBox{
            name:no_task_record
            text:"${no_task_record}"
        }
    }
    <==>
    
}

Tab#ssh
{
    visible:false
    ${#page_ssh_task}
} 
