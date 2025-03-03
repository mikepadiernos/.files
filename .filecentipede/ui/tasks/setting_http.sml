VBoxLayout#http
{
    ComboBox#http_uri{
        size-adjust:minimum
        stretch:expand
        vtype:text
    }
    Tab
    {
        class:inner
        position:bottom
        {
            text:"${attributes}"
            layout:{
                type:VBoxLayout
                margin:0
            }
            GridLayout
            {
                column:6
                
                "${method}:" ComboBox{
                    name:method
                    editable:true
                    vtype:text
                    current:0
                    
                    GET,POST,OPTIONS,PUT,PATCH,TRACE
                }
                
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
                    max:1024
                    1 2 4 8 16 32 64 128 256 512
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
            }
            GridLayout
            {
                column:2
                
                "${file_name}:" HBoxLayout
                {
                    LineEdit{
                        name:file_name
                    }
                    "${catalog}:" ComboBox#http_catalog{
                        name:catalog
                        vtype:data
                        editable:false
                      
                        {text:"  ---  ",data:""}
                    }
                }
                "${save_path}:" HBoxLayout
                {
                    ComboBox#http_save_path
                    {
                        name:save_path
                        vtype:text
                        editable:true
                        stretch:"expand"
                        placeholder:"${save_path_placeholder}"
                        items:$filec-paths()
                    }
                    Button{
                        text:"..."
                        click:$select-dir("${save_path}",${#http_save_path})
                    }
                }
                "User Agent:" ComboBox#user_agents{
                    name:user_agent
                    vtype:text
                    editable:true
                    size-adjust:minimum
                    items:$filec-user-agents()
                }
                "${proxy}:" HBoxLayout
                {
                
                    ComboBox#http_proxy{
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
                    name:ignore_http_error
                    text:"${ignore_http_error}"
                }
                CheckBox{
                    name:auto_rename_file
                    text:"${auto_rename_file}"
                }
                CheckBox{
                    name:no_task_record
                    text:"${no_task_record}"
                }
            }
            8
        }
        {
            text:"Cookie"
            layout:{
                type:VBoxLayout
                margin:0
            }
            TextEdit{
                name:cookies
                placeholder:"${http_cookie_placeholder}"
            }
            2
        }
        {
            text:"Headers"
            layout:{
                type:VBoxLayout
                margin:0
            }
            TextEdit{
                name:headers
                placeholder:"${http_header_placeholder}"
            }
            2
        }
    }
    
    
}


