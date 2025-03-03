#page_network
{
    text:"${settings}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        layout:VBoxLayout
        
        GridLayout
        {
            column:4
            "${client_name}:" ComboBox{
                name:client_name
                editable:true
                stretch:expand
                vtype:text
                
                ""
                "filecxx/${__version__}"
                "qBittorrent/4.3.8"
                "Transmission 3.00"
                "µTorrent 3.5.5"
                "BitComet 1.8.2"
                "libtorrent/1.2.2.0"
                "BitSpirit v3.6.0"
            }
    
            "${encrypt_mode}:" ComboBox{
                name:encrypt_mode
                stretch:expand
                vtype:index
                
                "${force_encrypt}"
                "${allow_encrypt}"
                "${disable_encrypt}"
            }
            
            "${upload_algorithm}:" ComboBox{
                name:upload_algorithm
                stretch:expand
                vtype:index
                
                "${round_robin}"
                "${fastest_upload}"
                "${anti_leech}"
            }
            "Torrent ${port}:" SpinBox{
                name:torrent_port
                min:0
                max:65535
                special-text:"${random}"
            }
        }
    }
    GroupBox
    {
        title:"${proxy}"
        layout:HBoxLayout
        
        "${proxy}:" ComboBox#network_proxy{
            name:proxy
            vtype:data
            stretch:expand
            editable:false
        }
        ComboBox{
            name:proxy_mode
            editable:false
            vtype:index
            enable:false
            
            "${always}"
            "${if_available}"
            "${round_robin}"
            "${round_robin} - ${connections}"
        }
        ToolButton#show_proxies{
            icon:"icons/16/proxy.svg"
        }
    }
    GroupBox
    {
        title:"${options}"
        layout:HBoxLayout
        
        CheckBox{
            text:"${anonymous_mode}"
            name:anonymous_mode
        }
        CheckBox{
            name:torrent_enable_proxy
            text:"Torrent ${enable_proxy}"
        }
        CheckBox{
            text:"P2P ${enable_proxy}"
            enable:false
        }
    }
    GroupBox
    {
        title:"${tasks}"
        layout:{
            type:GridLayout
            column:2
        }
        HBoxLayout
        {
            "${max_downloading_tasks}:" SpinBox{
                name:max_downloading_tasks
                min:0
                max:2147483647
                special-text:"${unlimited}"
            }
            <==>
        }
        HBoxLayout
        {
            "${max_uploading_tasks}:" SpinBox{
                name:max_uploading_tasks
                min:0
                max:2147483647
                special-text:"${unlimited}"
            }
            <==>
        }
    }
    GroupBox
    {
        layout:HBoxLayout
        title:"${nat_port_mapping}"
        
        CheckBox{
            name:enable_upnp
            text:"${enable_upnp}"
        }
        CheckBox{
            name:enable_natpmp
            text:"${enable_natpmp}"
        }
    }
    <==>
}

Tab#network
{
    visible:false
    ${#page_network}
}

