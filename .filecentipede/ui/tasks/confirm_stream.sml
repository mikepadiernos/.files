
Action#act_check_on
{
	text:"${checkbox_on}"
    icon:"icons/16/none.svg"
}

Action#act_uncheck_off
{
	text:"${checkbox_off}"
    icon:"icons/16/none.svg"
}

Action#act_check_all
{
	text:"${checkbox_on_all}"
    icon:"icons/16/none.svg"
}

Action#act_uncheck_all
{
	text:"${checkbox_off_all}"
    icon:"icons/16/none.svg"
}

Menu#context_menu
{
    ${#act_check_on}
    ${#act_uncheck_off}
    ${#act_check_all}
    ${#act_uncheck_all}
}

#attributes
{
    text:"${attributes}"
    layout:VBoxLayout
    
    FileSystem#files
    {
        sortable:true
        stripe:true
        editable:false
        checkable:true
        selection:rows
        icon-size:24
        columns-height:26
        columns:{
            {name:file_name,text:"${name}",width:450}
            {name:segments,text:"${segments}",width:80}
            {name:resid,text:"${text}",width:80,format:bytes}
        }
        layout:{
            type:VBoxLayout
            align:center
            
            Widget#loading
            {
                css:"background:transparent"
                layout:{
                    type:VBoxLayout
                    column:1
                    align:hcenter
                }
                Img{src:"ui/css/images/loading_clock.gif"}
                "${downloading_metadata}"
            }
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
        "User Agent:" ComboBox#user_agents{
            name:user_agent
            vtype:text
            editable:true
            size-adjust:minimum
            items:$filec-user-agents()
        }
        TextEdit{
            name:cookies
            placeholder:"${http_cookie_placeholder}"
        }
        TextEdit{
            name:headers
            placeholder:"${http_header_placeholder}"
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
}


#decode
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
        ${#decode}
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
 
