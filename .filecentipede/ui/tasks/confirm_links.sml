Action#act_delete_selected
{
	text:"${delete}"
    icon:"icons/16/delete.svg"
}

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
    ${#act_delete_selected}
    ${#act_check_on}
    ${#act_uncheck_off}
    ${#act_check_all}
    ${#act_uncheck_all}
}

#links
{
    text:"${addresses}"
    layout:VBoxLayout
    Table#table
    {
        sortable:true
        stripe:true
        editable:true
        stretch-last-section:true
        selection:rows
        icon-size:24
        context-menu:${#context_menu}
        columns-height:26
        columns:{
            {name:name,text:"${name}",width:180}
            {name:file_name,text:"${file_name}",width:240}
            {name:url,text:"URL"}
        }
    }
    GridLayout
    {
        "${page_url}" LineEdit
        {
            name:page_url
        }
        "${filter}:" HBoxLayout
        {
            ComboBox#filter_field
            {
                vtype:index
                editable:false
            
                "${name}"
                "${file_name}"
            }
            ComboBox#filter
            {
                min-width:80
                vtype:data
                editable:false
                
                "${none}"
            }
            LineEdit#filter_text{
                placeholder:"${filter}"
            }
        }
    }
}

#config
{
    text:"${config}"
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
            max:12000
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
        column:2

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
        "User Agent:" ComboBox#user_agents{
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
    w:800
    h:600
    
    Tab#tab
    {
        ${#links}
        ${#config}
    }
    HBoxLayout
    {
        "${catalog}:" ComboBox#catalog{
            name:catalog
            vtype:data
            editable:false
            
            "  ---  "
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
