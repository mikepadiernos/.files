#checksum_text
{
    text:"${text}"
    layout:VBoxLayout
    
    TextEdit#text{
      
    }
    GridLayout
    {
        column:2
        
        "CRC32: " LineEdit{
            name:text_crc32
        }
        "MD5: " LineEdit{
            name:text_md5
        }
        "SHA1: " LineEdit{
            name:text_sha1
        }
        "SHA256: " LineEdit{
            name:text_sha256
        }
    }
}

#checksum_file
{
    text:"${file}"
    layout:VBoxLayout
    
    HBoxLayout
    {
        "${path}:" LineEdit#file_path{}
        
        ToolButton{
            icon:"icons/24/add_file.svg"
            icon-size:24
            click:$select-file(${#file_path})
        }
        ToolButton{
            icon:"icons/24/directory.svg"
            icon-size:24
            click:$select-dir(${#file_path})
        }
    }
    
    GroupBox
    {
        title:"${state}"
        layout:VBoxLayout
        GridLayout
        {
            column:4
            "${state}: " LineView{
                name:state
                value:"${stopped}"
            }
        }
        GridLayout
        {
            column:4
            
            "CRC32: " Progress{
                name:progress_crc32
                min:0
                max:100
                value:0
            }
            "MD5: " Progress{
                name:progress_md5
                min:0
                max:100
                value:0
            }
            "SHA1: " Progress{
                name:progress_sha1
                min:0
                max:100
                value:0
            }
            "SHA256: " Progress{
                name:progress_sha256
                min:0
                max:100
                value:0
            }
        }
    }
    GroupBox
    {
        title:"${result}"
        layout:{
            type:GridLayout
            column:3
        }
        "${size}:" LineEdit#file_size{
            name:file_size
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#file_size})
        }
        
        CheckBox{
            name:file_crc32_check
            text:CRC32
            value:true
        } 
        LineEdit#file_crc32{
            name:file_crc32
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#file_crc32})
        }
        
        CheckBox{
            name:file_md5_check
            text:MD5
            value:true
        } 
        LineEdit#file_md5{
            name:file_md5
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#file_md5_check})
        }
        
        CheckBox{
            name:file_sha1_check
            text:SHA1
            value:true
        } 
        LineEdit#file_sha1{
            name:file_sha1
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#file_sha1})
        }
        
        CheckBox{
            name:file_sha256_check
            text:SHA256
            value:true
        } 
        LineEdit#file_sha256{
            name:file_sha256
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#file_sha256})
        }

    }
    HBoxLayout
    {
        Button#save{
            text:"${save}"
        }
        <==>
        Button#start{
            text:"${start}"
        }
        Button#stop{
            text:"${stop}"
            enable:false
        }
    }
}

#checksum_help
{
    text:"${help}"
    layout:VBoxLayout
    
    Edit{
        viewonly:true
        value:"
        ${command_line}:<br/><br/>fileu --checksum ${path}
        <br/>filec md5 ${path}
        <br/>filec crc32 ${path}
        <br/>filec sha1 ${path}
        <br/>filec sha256 ${path}
        "
    }
}


Dialog#main
{
    title:"${checksum}"
    layout:VBoxLayout
    width:650
    height:400
    droppable:true
    Tab#tab
    {
        ${#checksum_text}
        ${#checksum_file}
        ${#checksum_help}
    }
}
