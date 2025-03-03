#page_service
{
    text:"${settings}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        layout:HBoxLayout
        
        "${state}:" ComboBox{
            name:enable
            min-width:80
            vtype:index
            
            "${disable}"
            "${enable}"
        }
        "${remote_access}:" ComboBox{
            name:remote_access
            min-width:80
            vtype:index
            
            "${disable}"
            "${enable}"
        }
        "${webui}:" ComboBox{
            name:enable_webui
            min-width:80
            vtype:index
            
            "${disable}"
            "${enable}"
        }
        <==>
    }
    
    GroupBox
    {
        title:"${access}"
        layout:VBoxLayout
        
        Label
        {
            wordwrap:true
            "${notice}: (${service_port_notice_})"
        }
        
        GridLayout
        {
            column:4
            
            "${port}:" SpinBox{
                name:port
                min:1025
                max:65535
                value:10111
            }
            "",""
      
            "${password}:" LineEdit{
                name:password
                type:pw
            }
            CheckBox{
                name:skip_localhost_pass
                text:"${skip_localhost_password_authentication}"
                value:true
            }
        }
    }
    Label
    {
        wordwrap:true
        css:"color:gray"
        
        "${service_description_}"
    }
    <==>
}

Widget#service
{
    layout:{
        type:VBoxLayout
        margin:0
    }
    Tab{
        ${#page_service}
    }
   
}
