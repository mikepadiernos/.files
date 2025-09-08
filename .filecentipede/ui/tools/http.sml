#request_widget
{
    text:"${request}"
    layout:VBoxLayout
    
    "${headers}:" TextEdit#request_headers{}
    HBoxLayout
    {
        "${data}:"
        <==>
        "Content-Type:" ComboBox#request_content_type
        {
            editable:true
            vtype:text
            
            "text/plain"
            "raw"
            "application/json"
            "application/octet-stream"
            "application/x-www-form-urlencoded"
            "multipart/form-data"
        }
    }
    TextEdit#request_data
    {
        
    }
}

#response_headers_widget
{
    text:"${response_headers}"
    layout:VBoxLayout
    
    GridLayout
    {
        column:4
        
        "${code}:" LineEdit{
            name:response_code
        }
        "${status}:" LineEdit{
            name:response_status
        }
    }
    "${headers}:" TextEdit{
        name:response_headers
    }
    "${cookies}:" TextEdit{
        name:response_cookies
    }
    
}

#response_data_widget
{
    text:"${response_data}"
    layout:VBoxLayout
    
    TextEdit#response_data{
        css:"font-size: 13px;font-family: Source Code Pro;"
    }
    HBoxLayout{
        "${keyword}:" LineEdit#search_keyword{
            
        }
        Label#search_found{}
        Button#search_btn{
            text:"${search}"
        }
    }
}

Widget#cmd_widget
{
    visible:false
    layout:VBoxLayout
    
    HBoxLayout
    {
        "${template}:" LineEdit#tpl_name{
            text:"$${{command}}"
        }
        "${prefix}:" ComboBox#tpl_prefix{
            editable:true
            vtype:text
            
            ""
            "/bin/bash -c $@|/bin/bash . echo "
            "C:\windows\system32\cmd.exe /c "
        }
    }
    HBoxLayout
    {
        "${text}:" TextEdit#tpl_text{

        }
    }
}

Dialog#main
{
    title:"${http_tool}"
    layout:VBoxLayout
    w:800
    h:600
    HBoxLayout
    {
        "URL:" ComboBox#request_method{
            editable:true
            vtype:text
            current:0
            
            "GET","POST","PUT","HEAD","DELETE","OPTIONS","TRACE","PATCH","MOVE","COPY","LINK","UNLINK"
        }
        LineEdit#request_url{
           
        }
        Button#btn_request{
            text:"${request}"
        }
        Button#btn_abort{
            text:"${abort}"
        }
        Button{
            icon:"icons/16/cmd.svg"
            checkable:true
            toggle:$visible{#cmd_widget}(...)
        }
    }
    ${#cmd_widget}
    Tab
    {
        ${#request_widget}
        ${#response_headers_widget}
        ${#response_data_widget}
    }
}
 
