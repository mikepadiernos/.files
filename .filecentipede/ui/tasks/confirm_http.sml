#attributes
{
    text:"${attributes}"
    layout:VBoxLayout
    
    FileSystem#files
    {
        sortable:true
        stripe:true
        editable:false
        checkable:false
        selection:rows
        icon-size:24
        columns-height:26
        columns:{
            {name:file_name,text:"${name}",width:450}
            {name:file_size,text:"${size}",width:80,format:bytes}
        }
    }
    GridLayout
    {
        column:2

        "${address}:" HBoxLayout
        {
            LineEdit#address
            {
                name:uri
                readonly:true
            }
            ToolButton{
                icon:"icons/16/copy.svg"
                click:$copy(${#address})
            }
        }
        "${page_url}:" LineEdit
        {
            name:page_url
        }
        "${save_path}:" HBoxLayout
        {
            ComboBox#save_path
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
                click:$select-dir("${save_path}",${#save_path})
            }
        }
                    
        "${catalog}:" HBoxLayout
        {
            ComboBox#catalog{
                name:catalog
                vtype:data
                editable:false
                
                "  ---  "
            }
            "${proxy}:" HBoxLayout
            {
            
                ComboBox#proxy{
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
        
    }
}

#settings
{
    text:"${settings}"
    layout:VBoxLayout
    
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
            1 2 4 8 16 32 64
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
        "User Agent:" ComboBox{
            name:user_agent
            vtype:text
            editable:true
            size-adjust:minimum
            items:$filec-user-agents()
            
        }
        "Cookies:" TextEdit{
            name:cookies
            //fixed-height:27
            //focused-height:60
            placeholder:"${http_cookie_placeholder}"
        }
        "Headers:" TextEdit{
            name:headers
            //fixed-height:27
            //focused-height:60
        
            placeholder:"${http_header_placeholder}"
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
}


Dialog#main
{
    title:"${add_task}"
    layout:VBoxLayout
    w:600
    h:400
    
    Tab
    {
        ${#attributes}
        ${#settings}
    }
    HBoxLayout
    {
        CheckBox#without_confirm{
            text:"${dont_show_this_again}"
        }
        <==>
        Button{
            icon:"icons/16/close.svg"
            text:"${cancel}"
            click:$close{#main}()
        }
        Button#download_later{
            icon:"icons/16/delay.svg"
            text:"${download_later}"
        }
        Button#download_now{
            icon:"icons/16/download.svg"
            text:"${download_now}"
        }
    }
}
