#about
{
    text:"${about}"
    layout:VBoxLayout
    Edit{
        viewonly:true
        value:"${about_content_}<br/><br/>"
    }
    
    GridLayout
    {
        "${website}: " HBoxLayout
        {
            A{"http://www.filecxx.com"}
            <==>
        }
    }
    
}

#share
{
    text:"${share}"
    layout:VBoxLayout
}

#source_code
{
    text:"${source_code}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"C++ ${open_source_libraries}"
        layout:VBoxLayout
        A{
            text:"boost"
            link:"https://www.boost.org/"
        }
        A{
            text:"libtorrent"
            link:"https://www.libtorrent.org/"
        }
        A{
            text:"Qt5 Widgets"
            link:"https://qt.io/"
        }
    }
    GroupBox
    {
        title:"git"
        layout:VBoxLayout
        
        A{"https://github.com/filecxx/FileCentipede"}
    }
    <==>
}

Dialog#main
{
    title:"${about}"
    layout:VBoxLayout
    w:500
    h:300
    
    HBoxLayout
    {
        spacing:20
        Img{
            max-width:48
            max-height:48
            "icons/icon.png"
        }
        VBoxLayout
        {
            spacing:8
            Label
            {
                css:"font-size:16px;font-weight:bold"
                "${software_name_}"
            }
            HBoxLayout{
                "${version}: ${__version__} ${premium_version}"
            }
        }
    }
    Tab#tab
    {
        ${#about}
        ${#share}
        ${#source_code}
    }
    HBoxLayout{
        <==>
        Button{
            text:"${close}"
            icon:"icons/16/close.svg"
            click:$close{#main}()
        }
    }
}
