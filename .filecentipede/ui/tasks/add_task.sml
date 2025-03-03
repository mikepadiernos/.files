#placeholders
{
    m3u8:"m3u8"
    
    file:"[${protocol}] :
HTTP, HTTPS, FTP, FTPS, SFTP, SSH, HASH, Magnet, Torrent, ed2k
    
[${custom_protocol}] :
filec, fileu, thunder, flashget, qqdl, JSON

[${command_line}] :
curl, wget, aria2, axel
"
    directory:"[${protocol}] :
WebDAV(HTTP, HTTPS), FTP, FTPS, SFTP, SSH
    
[${custom_protocol}] :
filec, fileu, JSON

[${command_line}] :
curl, wget, aria2, axel

${example}:
http://user:password@filecxx.com/dav/
"
}

Action#act_save_path
{
    icon:"icons/16/directory.svg"
    text:"${save_path}"
}

Action#act_uri_generate
{
    icon:"icons/16/partials.svg"
    text:"URI ${generate}"
}

Action#import_http_raw
{
    icon:"icons/16/import.svg"
    text:"${import} HTTP Raw"
}

TextEdit#addresses
{
    css:"padding:2"
}

HBoxLayout#buttons
{
    ToolButton{
        button-style:TextBesideIcon
        popup-mode:instant
        icon:"icons/16/all.svg"
        icon-size:16
        ${#act_uri_generate}
        ${#import_http_raw}
        ${#act_save_path}
    }
    <==>
    /*
    Button#save_as{
        icon:"icons/16/save_as.svg"
        text:"${save_as}"
        visible:false
    }*/
    Button#download_later{
        icon:"icons/16/delay.svg"
        text:"${download_later}"
    }
    Button#download_now{
        icon:"icons/16/download.svg"
        text:"${download_now}"
    }
    
}
            
Dialog#main
{
    title:"${add_task}"
    icon:"icons/24/add.svg" 
    layout:VBoxLayout
    w:650
    h:400
    
    Tab#tab
    {
        {
            text: "${addresses}"
            layout: {
                type:VBoxLayout
                margin:5
            }
            ${#addresses}
        }
        {
            text: HTTP
            visible: false
            data:"ui/tasks/setting_http.sml"
        }
        {
            text: FTP
            visible: false
            data:"ui/tasks/setting_ftp.sml"
        }
        {
            text: "${torrent}"
            visible: false
            data:"ui/tasks/setting_torrent.sml"
        }
        {
            text:"${ed2k}"
            visible: false
            data:"ui/tasks/setting_ed2k.sml"
        }
        {
            text:"${stream}"
            visible: false
            data:"ui/tasks/setting_stream.sml"
        }
        {
            text: SSH
            visible: false
            data:"ui/tasks/setting_ssh.sml"
        }
    }
    ${#buttons}
    
}
