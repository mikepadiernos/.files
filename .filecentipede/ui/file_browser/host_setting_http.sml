VBoxLayout#http
{
    margin:2
    Tab
    {
        class:inner
        position:bottom
        {
            text:"${config}"
            layout:VBoxLayout
            
            GridLayout
            {
                "${deeps}:" HBoxLayout{
                    SpinBox{
                        name:deeps
                        value:2
                    }
                    "${external_deeps}:" SpinBox{
                        name:deeps
                        value:2
                    }
                }
                "${layout}:" ComboBox{
                    name:layout
                    vtype:index
                    
                    "${optimized}"
                    "${file_type}"
                    "${origin}"
                }
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
                "Header:" TextEdit{
                    name:headers
                    placeholder:"${http_header_placeholder}"
                }
            }
            GridLayout
            {
                column:2
                
                CheckBox{
                    name:external_links
                    text:"${external_links}"
                    value:true
                }
                CheckBox{
                    name:subdomain
                    text:"${subdomain}"
                    value:true
                }
            }
        }
        {
            text:"${anti_block}"
            layout:VBoxLayout
            
            "${stop_and_warning}:" TextEdit
            {
                name:stop_and_warning
            }
        }
    }
}
