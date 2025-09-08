.uncheck
{
    value:false
}
.disabled
{
    enable:false
}
.proxy
{
    vtype:data
    enable:false
    editable:false
    {
        text:"${no_proxy}"
        data:0
    }
}
.proxy_mode
{
    editable:false
    enable:false
    vtype:index
    
    "${always}"
    "${if_available}"
    "${round_robin}"
    "${round_robin} - ${connections}"
}

Widget#rule_http
{
    visible:false
    layout:VBoxLayout
    
    GridLayout
    {
        column:6
        
        CheckBox.uncheck#enable_http_max_connections{
            text:"${max_connections}"
            click:$enable{#http_max_connections}(...)
        } 
        SpinBox.disabled#http_max_connections{
            name:max_connections
            editable:true
            value:8
        }
        
        CheckBox.uncheck#enable_http_speed_limit_download{
            text:"${speed_limit_download}"
            click:$enable{#http_speed_limit_download}(...)
        } 
        SpinBox.disabled#http_speed_limit_download
        {
            name:speed_limit_download
            min:0
            max:2147483647
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox.uncheck#enable_http_speed_limit_upload{
            text:"${speed_limit_upload}"
            click:$enable{#http_speed_limit_upload}(...)
        } 
        SpinBox.disabled#http_speed_limit_upload{
            name:speed_limit_upload
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
    }
    
    CheckBox.uncheck#enable_http_user_agent{
        text:"User Agent"
        click:$enable{#http_user_agents}(...)
    } 
    ComboBox.disabled#http_user_agents
    {
        name:user_agent
        vtype:text
        editable:true
        size-adjust:minimum
        items:$filec-user-agents()
    }
    CheckBox.uncheck#enable_http_headers{
        text:"Headers"
        click:$enable{#http_headers}(...)
    } 
    TextEdit.disabled#http_headers{
        name:headers
        placeholder:"${http_header_placeholder}"
    }
    
    CheckBox.uncheck#enable_http_cookies{
        text:"Cookies"
        click:$enable{#http_cookies}(...)
    } 
    TextEdit.disabled#http_cookies
    {
        name:cookies
        placeholder:"${http_cookie_placeholder}"
    }

    HBoxLayout
    {
        CheckBox.uncheck#enable_http_proxy{
            text:"${proxy}"
            click:$enable{#http_proxy}(...)
        } 
        ComboBox.proxy#http_proxy{
            name:proxy
        }
        ComboBox.proxy_mode{
            name:proxy_mode
        }
        <==>
    }
}

Widget#rule_ftp
{
    layout:VBoxLayout
    visible:false
    GridLayout
    {
        column:4

        CheckBox.uncheck#enable_ftp_max_connections{
            text:"${max_connections}"
            click:$enable{#ftp_max_connections}(...)
        } 
        SpinBox.disabled#ftp_max_connections{
            name:max_connections
            value:1
        }
        
        CheckBox.uncheck#enable_ftp_speed_limit_download{
            text:"${speed_limit_download}"
            click:$enable{#ftp_speed_limit_download}(...)
        } 
        SpinBox.disabled#ftp_speed_limit_download{
            name:speed_limit_download
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox.uncheck#enable_ftp_speed_limit_upload{
            text:"${speed_limit_upload}"
            click:$enable{#ftp_speed_limit_upload}(...)
        } 
        SpinBox.disabled#ftp_speed_limit_upload{
            name:speed_limit_upload
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox.uncheck#enable_ftp_user{
            text:"${user}"
            click:$enable{#ftp_user}(...)
        } 
        LineEdit.disabled#ftp_user{
            name:user
        }
        
        CheckBox.uncheck#enable_ftp_pass{
            text:"${password}"
            click:$enable{#ftp_pass}(...)
        } 
        LineEdit.disabled#ftp_pass{
            name:pass
            type:password
        }
    }
    
    HBoxLayout
    {
        CheckBox.uncheck#enable_ftp_proxy{
            text:"${proxy}"
            click:$enable{#ftp_proxy}(...)
        } 
        ComboBox.proxy#ftp_proxy{
            name:proxy
        }
        ComboBox.proxy_mode{
            name:proxy_mode
        }
        <==>
    }
    <==>
}

Widget#rule_ssh
{
    layout:VBoxLayout
    visible:false
    GridLayout
    {
        column:4

        CheckBox.uncheck#enable_ssh_max_connections{
            text:"${max_connections}"
            click:$enable{#ssh_max_connections}(...)
        } 
        SpinBox.disabled#ssh_max_connections{
            name:max_connections
            value:1
        }
        
        CheckBox.uncheck#enable_ssh_speed_limit_download{
            text:"${speed_limit_download}"
            click:$enable{#ssh_speed_limit_download}(...)
        } 
        SpinBox.disabled#ssh_speed_limit_download{
            name:speed_limit_download
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox.uncheck#enable_ssh_speed_limit_upload{
            text:"${speed_limit_upload}"
            click:$enable{#ssh_speed_limit_upload}(...)
        } 
        SpinBox.disabled#ssh_speed_limit_upload{
            name:speed_limit_upload
            max:999999999
            suffix:KB
            special-text:"${unlimited}"
        }
        
        CheckBox.uncheck#enable_ssh_user{
            text:"${user}"
            click:$enable{#ssh_user}(...)
        } 
        LineEdit.disabled#ssh_user{
            name:user
        }
        
        CheckBox.uncheck#enable_ssh_pass{
            text:"${password}"
            click:$enable{#ssh_pass}(...)
        } 
        LineEdit.disabled#ssh_pass{
            name:pass
            type:password
        }
    }
    
    HBoxLayout
    {
        CheckBox.uncheck#enable_ssh_proxy{
            text:"${proxy}"
            click:$enable{#ssh_proxy}(...)
        } 
        ComboBox.proxy#ssh_proxy{
            name:proxy
        }
        ComboBox.proxy_mode{
            name:proxy_mode
        }
        <==>
    }
    <==>
}

Dialog#main
{
    title:"${add} / ${edit}"
    icon:"icons/16/edit.svg" 
    layout:VBoxLayout
    width: 600
    height: 400
    
    GroupBox#host
    {
        title:"${host}"
        layout:{
            type:GridLayout
            column:4
        }
        "${name}: " LineEdit{
            name:name
            placeholder:"${optional}"
        }
        "${protocol}: " ComboBox#protocol
        {
            name:subtype
            vtype:data
            {
                text:"HTTP(S)"
                data:http
            }
            {
                text:"FTP(S)"
                data:ftp
            }
            {
                text:"SSH"
                data:ssh
            }
        }
       
        "${host}: " LineEdit{
            name:host
            placeholder:"IP / ${domain}"
        }
        "${port}: " SpinBox{
            name:port
            min:0
            max:65535
            value:0
        }
    }
    GroupBox#config
    {
        title:"${config}"
        layout:{
            type:VBoxLayout
            margin:0
            
            ${#rule_http}
            ${#rule_ftp}
            ${#rule_ssh}
        }
    }
    HBoxLayout
    {
        <==>
        Button#save{
            icon:"icons/16/save.svg"
            text:"${save}"
        }
        Button#cancel{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
}
 
