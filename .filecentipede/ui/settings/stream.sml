#page_stream_task
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
            value:8
            1 2 4 8 16 32 64 128 256 512
        }
        
        "${max_retry}:" SpinBox{
            name:max_retry
            min:0
            max:9999
        }
        
        "${max_redirect}:" SpinBox{
            name:max_redirect
            max:20
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
        
    }
    VBoxLayout
    {
        
        HBoxLayout{
            "User Agent:" 
        }
        HBoxLayout
        {
            ComboBox{
                name:user_agent
                vtype:text
                editable:true
                size-adjust:minimum
                items:$filec-user-agents()
            }
        }
        "Headers:" TextEdit{
            name:headers
            placeholder:"${http_header_placeholder}"
        }
    }
    GroupBox
    {
        title:"${attributes}"
        layout:HBoxLayout

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
            name:ignore_server_busy
            text:"${ignore_server_busy}"
        }
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
            value:true
        }
        CheckBox{
            name:auto_merge
            text:"${auto_merge}"
            value:true
        }
        CheckBox{
            name:no_task_record
            text:"${no_task_record}"
        }
    }
    <==>
    
}

Tab#stream
{
    visible:false
    ${#page_stream_task}
} 
 
