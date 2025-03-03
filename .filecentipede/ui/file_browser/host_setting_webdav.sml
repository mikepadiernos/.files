GridLayout#webdav
{
    GridLayout
    {
        column:2
        
        "User Agent:" ComboBox{
            name:user_agent
            vtype:text
            editable:true
            size-adjust:minimum
            items:$filec-user-agents()
        }
        "Cookie:" TextEdit{
            name:cookies
            placeholder:"${http_cookie_placeholder}"
        }
        "Headers:" TextEdit{
            name:headers
            placeholder:"${http_header_placeholder}"
        }
    }
    
}
 
