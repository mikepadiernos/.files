VBoxLayout#stream
{
    HBoxLayout
    {
        ComboBox#stream_uri{
            size-adjust:minimum
            stretch:expand
            vtype:text
        }
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
                
                "${connect_timeout}:" SpinBox{
                    name:connect_timeout
                    max:120000
                    step:1000
                    suffix:ms
                }
                "${max_connections}:" ComboBox{
                    name:max_connections
                    vtype:number
                    editable:true
                    max:1024
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
            GridLayout
            {
                column:2

                "${file_name}:" HBoxLayout
                {
                    LineEdit{
                        name:file_name
                    }
                    "${catalog}:" ComboBox#stream_catalog{
                        name:catalog
                        vtype:data
                        editable:false
                        {text:"  ---  ",data:""}
                    }
                }
                "${save_path}:" HBoxLayout
                {
                    ComboBox#stream_save_path
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
                        click:$select-dir("${save_path}",${#stream_save_path})
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
                
                    ComboBox#stream_proxy{
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
                    name:ignore_server_busy
                    text:"${ignore_server_busy}"
                }
                CheckBox{
                    name:auto_rename_file
                    text:"${auto_rename_file}"
                }
                CheckBox{
                    name:auto_merge
                    text:"${auto_merge}"
                }
                CheckBox{
                    name:no_task_record
                    text:"${no_task_record}"
                }
            }
            8
        }
        {
            text:"${decode}"
            layout:{
                type:VBoxLayout
                margin:0
            }
            GridLayout
            {
                column:2

                "${base_url}:" LineEdit{
                    name:base_url
                    placeholder:"${optional}"
                }
                "Key: " HBoxLayout{
                    LineEdit{
                        name:key_data
                        placeholder:"${optional}"
                    }
                    ComboBox{
                        vtype:index
                        name:key_mode
                        Base64
                    }
                }
                "IV (HEX): " HBoxLayout{
                    LineEdit{
                        name:iv
                        placeholder:"${optional}"
                    }
                }
            }
            <==>
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

