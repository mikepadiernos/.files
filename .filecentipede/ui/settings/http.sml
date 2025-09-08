#page_http_task
{
    text:"${task}"
    layout:VBoxLayout
    GroupBox
    {
        title:"${options}"
        layout:{type:GridLayout,column:4}
    
        "${method}:" ComboBox{
            name:method
            editable:true
            vtype:text
            current:0
            
            GET
            POST
            HEAD
            OPTIONS
            PUT
            PATCH
            DELETE
            TRACE
            CONNECT
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
            1 2 4 8 16 32 64 128
        }
        
        "${max_retry}:" SpinBox{
            name:max_retry
            min:0
            max:999999999
        }
        
        "${max_redirect}:" SpinBox{
            name:max_redirect
            max:20
        }
        
        "${speed_limit}:" SpinBox{
            name:speed_limit
            max:999999999
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
            ComboBox#http_user_agents{
                name:user_agent
                vtype:text
                editable:true
                size-adjust:minimum
                items:$filec-user-agents()
            
            }
            ToolButton#edit_http_user_agents{
                icon:"icons/16/edit.svg"
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
        layout:{
            type:GridLayout
            column:3
        }
        title:"${behavior}"
     
        CheckBox{
            name:ignore_remote_modified
            text:"${ignore_remote_modified}"
        }
        CheckBox{
            name:ignore_server_busy
            text:"${ignore_server_busy}"
        }
        CheckBox{
            name:ignore_http_error
            text:"${ignore_http_error}"
        }
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
            value:true
        }
        CheckBox{
            name:without_confirm
            text:"${without_confirm}"
        }
        CheckBox{
            name:no_task_record
            text:"${no_task_record}"
        }
    }
    
} 

Tab#http
{
    visible:false
    ${#page_http_task}
}

