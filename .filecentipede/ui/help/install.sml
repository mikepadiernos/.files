Alert#skip_install_alert
{
    icon:warning
    title:"${install}"
    text:"${install}:<br/>[${menu}] -> [${help}] -> [${install}]"
    
    {
        value:1
        text:"${OK}"
    }
    {
        value:0
        text:"${cancel}"
    }
}

Dialog#main
{
    title:"${install}"
    icon:"icons/16/home.svg" 
    layout:VBoxLayout
    width:600
    height:500

    Edit#licence
    {
        readonly:true
        value:"<h2 style='text-align:center'>${software_name_} ${__version__} - ${premium_version}</h2>${install_notice_}<br/><br/>${install_notice2_}<br/><br/>${install_notice3_}<br/>"
    }
    FileSystem#loading
    {
        visible:false
        layout:{
            type:VBoxLayout
            align:center
            
            Widget
            {
                css:"background:transparent"
                layout:{
                    type:VBoxLayout
                    column:1
                    align:hcenter
                }
                Img{src:"ui/css/images/loading_clock.gif"}
                "${waiting}......."
            }
        }
    }

    GridLayout
    {
        "${language}:" ComboBox#language{
            name:lang
            stretch:expand
            vtype:data
            "${auto}"
        }
        "${software_name}: " LineEdit{
            name:software_name
            value:"${software_name_}"
        }
    }
    GroupBox#options
    {
        title:"${options}"
        layout:VBoxLayout
        
        HBoxLayout{
            CheckBox{
                name:desktop_shortcuts
                text:"${desktop_shortcuts}"
                value:true
            }
            CheckBox{
                name:tray_icon
                text:"${tray_icon}"
                value:false
            }
            CheckBox{
                name:autostart
                text:"${autostart} (windows)"
            }
            CheckBox{
                name:system_service
                text:"${system_service}(${recommended})"
                value:true
                css:"color:green"
            }
            
        }
    }

    GroupBox
    {
        title:"${installation_directory}"
        layout:VBoxLayout
        
        HBoxLayout
        {
    
            PathEdit#path{
                mode:dir
                placeholder:"${path}"
            }
        }
        RadioGroup{${#to_current_dir},${#to_other_dir}}
    }
    
  
    HBoxLayout
    {
        Button#btn_skip
        {
            text:"${skip}"
        }
        <==>
        Button#btn_install{
            icon:"icons/16/home.svg"
            text:"${install}"
        }
        Button#btn_cancel{
            text:"${cancel}"
        }
    }
}
 
