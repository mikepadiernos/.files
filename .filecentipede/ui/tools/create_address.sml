#config
{
    text:"${config}"
    layout:VBoxLayout
    
    "${origin} URL:" TextEdit#addresses{
        name:uri
        placeholder:"HTTP, HTTPS, FTP, FTPS"
    }
    
    GridLayout{
        column:2
        
        "${page_url}: " LineEdit{
            name:page_url
            placeholder:"${page_url_placeholder_}"
        }
        /*
        "${info} URL: " LineEdit{
            name:info_url
        }*/
    }

}

#http
{
    text:"HTTP"
    visible:false
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        layout:{
            type:GridLayout
            column:6
        }
        
        CheckBox{
            text:"${method}"
            value:false
            click:$enable{#http_method}(...)
        } 
        ComboBox#http_method{
            name:method
            enable:false
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
        
        CheckBox{
            text:"${max_connections}"
            value:false
            click:$enable{#http_max_connections}(...)
        } 
        SpinBox#http_max_connections{
            name:max_connections
            enable:false
            editable:true
            value:8
        }
        
        CheckBox{
            text:"${speed_limit_download}"
            value:false
            click:$enable{#http_speed_limit_download}(...)
        } 
        SpinBox#http_speed_limit_download
        {
            name:speed_limit_download
            min:0
            max:2147483647
            suffix:KB
            enable:false
            special-text:"${unlimited}"
        }
    }
    
    
    CheckBox{
        text:"User Agent"
        value:false
        click:$enable{#http_user_agents}(...)
    } 
    ComboBox#http_user_agents
    {
        name:user_agent
        vtype:text
        editable:true
        enable:false
        size-adjust:minimum
        items:$filec-user-agents()
    }
    
    CheckBox{
        text:"Headers"
        value:false
        click:$enable{#http_headers}(...)
    } 
    TextEdit#http_headers{
        name:headers
        enable:false
        placeholder:"${http_header_placeholder}"
    }
    
    CheckBox{
        text:"Cookies"
        value:false
        click:$enable{#http_cookies}(...)
    } 
    TextEdit#http_cookies
    {
        name:cookies
        enable:false
        placeholder:"${http_cookie_placeholder}"
    }
    
}

#ftp
{
    text:"FTP"
    layout:VBoxLayout
    visible:false
    GridLayout
    {
        column:6

        CheckBox{
            text:"${max_connections}"
            value:false
            enable:false
            click:$enable{#ftp_max_connections}(...)
        } 
        SpinBox#ftp_max_connections{
            enable:false
            name:max_connections
            value:1
        }
        
        CheckBox{
            text:"${speed_limit_download}"
            value:false
            click:$enable{#ftp_speed_limit_download}(...)
        } 
        SpinBox#ftp_speed_limit_download{
            name:speed_limit_download
            enable:false
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox{
            text:"${user}"
            value:false
            click:$enable{#ftp_user}(...)
        } 
        LineEdit#ftp_user{
            enable:false
            name:user
        }
        
        CheckBox{
            text:"${password}"
            value:false
            click:$enable{#ftp_pass}(...)
        } 
        LineEdit#ftp_pass{
            enable:false
            name:pass
        }
    }
    <==>
}


#help
{
    text:"${help}"
    layout:VBoxLayout
    
    Edit{
        viewonly:true
        value:"${filec_link_help_}"
    }
}

Dialog#result
{
    title:"${address}"
    layout:VBoxLayout
    
    TextEdit#result_text{
        
    }
    HBoxLayout{
        <==>
        Button#copy_close{
            text:"${copy} && ${close}"
            click:$close{#result}()
        }
        Button{
            text:"${close}"
            click:$close{#result}()
        }
    }
}

Dialog#main
{
    title:"${create_address}"
    layout:VBoxLayout
    w:600
    h:400
    
    Tab#tab{
        ${#config}
        ${#http}
        ${#ftp}
        ${#help}
    }
    HBoxLayout
    {
        CheckBox#hide_origin_address
        {
            text:"${hide_origin_address}"
        }
        CheckBox#immutable
        {
            text:"${immutable}"
        }
        CheckBox#silence_download
        {
            text:"${silence_download}"
        }
        <==>
        Button#btn_create{
            text:"${create}"
        }
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
} 
