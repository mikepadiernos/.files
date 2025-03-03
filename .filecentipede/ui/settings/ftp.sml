#page_ftp_task
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
            value:2
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

Tab#ftp
{
    visible:false
    ${#page_ftp_task}
}
