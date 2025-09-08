
#attributes
{
    GridLayout#attributes_settings
    {
        "${protocol}: " HBoxLayout
        {
            ComboBox#protocol
            {
                name:protocol
                vtype:data
                size-adjust:content
                /*
                {
                    text:"HTTP"
                    icon:"icons/16/http.svg"
                    data:"http"
                }
                {
                    text:"HTTPS"
                    icon:"icons/16/web.svg"
                    data:"https"
                }
                */
                {
                    text:"WebDAV"
                    icon:"icons/16/cloud.svg"
                    data:"webdav"
                }
                {
                    text:"WebDAVS"
                    icon:"icons/16/clouds.svg"
                    data:"webdavs"
                }
                {
                    text:"FTP"
                    icon:"icons/16/directory.svg"
                    data:"ftp"
                }
                {
                    text:"FTPS"
                    icon:"icons/16/ftps.svg"
                    data:"ftps"
                }
                {
                    text:"SSH"
                    icon:"icons/16/ssh.svg"
                    data:"ssh"
                }
            }
            /*
            ToolButton{
                text:"${more}..."
                icon:"icons/24/add.svg"
                data:"+"
            }*/
        }
     
        "${name}: " LineEdit{
            name:name
            placeholder:"${optional}"
        }
        "${host}: " LineEdit{
            name:host
            placeholder:"IP / ${domain}"
        }
        "${port}: " HBoxLayout{
            SpinBox#port{
                name:port
                min:1
                max:65535
                value:80
            }
            "${max_connections}:" SpinBox#max_connections{
                name:max_connections
                min:1
                max:64
                value:2
            }
            
        }
        "${connect_timeout}:" SpinBox{
            name:connect_timeout
            value:5000
            min:1000
            max:120000
            step:1000
          
            suffix:ms
        }
        
        "${user}: " LineEdit{
            name:user
            placeholder:"${optional}"
        }
        "${password}: " LineEdit{
            name:pass
            type:password
            placeholder:"${optional}"
        }
        "${path}: " LineEdit{
            name:path
            placeholder:"${optional}"
        }
        "${proxy}: " ComboBox#proxy{
            name:proxy
            vtype:data
            editable:false
            
            "${no_proxy}"
        }
    }
    GridLayout#attributes_options
    {
        column:3
        
        CheckBox{
            name:no_task_record
            text:"${no_task_record}"
        }
        CheckBox{
            name:cache
            text:"${cache}"
            value:true
        }
    }
}

EditDialog#main
{
    title-add:"${add_host}"
    title-edit:"${edit_host}"
    layout:VBoxLayout
    width:400
    height:300
    form:${#attributes}
    buttons:default
    
    Tab#tab
    {
        {
            text:"${attributes}"
            layout:VBoxLayout
    
            ${#attributes_settings}
            ${#attributes_options}
        }
        {
            text: HTTP
            visible: false
            data:"ui/file_browser/host_setting_http.sml"
        }
        {
            text: WebDAV
            visible: false
            data:"ui/file_browser/host_setting_webdav.sml"
        }
    }
    
}
 
