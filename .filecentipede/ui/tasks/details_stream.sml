DetailBar#details
{
    expanded:false
    
    {
        subset:attributes
        text:"${attributes}"
        icon-size:16
        icon:"icons/16/attributes.svg"
        layout:{
            type:VBoxLayout
            margin:10
        }
        GridLayout
        {
            column:6

            "${catalog}:" LineView{name:catalog}
            "${size}:" LineView{name:file_size,format:bytes}
            "${downloaded}:" LineView{name:downloaded,format:bytes}
            "${connectivity}:" LineView{name:connectivity}
            "${connect_timeout}:" LineView{name:connect_timeout,format:"number ms"}
            "${connections}:" LineView{name:connections}
            "${max_connections}:" LineView{name:max_connections}
            "${max_retry}:" LineView{name:max_retry}
            "${speed_limit_download}:" LineView{name:speed_limit_download,format:"number KB/s"}
            "${auto_merge}:" LineView{name:auto_merge}
            "${auto_rename_file}:" LineView{name:auto_rename_file}
            "${ignore_server_busy}:" LineView{name:ignore_server_busy}
            
            "${time_create}:" LineView{name:time_create,format:datetime}
            "${time_start}:" LineView{name:time_start,format:datetime}
            "${time_end}:" LineView{name:time_end,format:datetime}
        }
   
    }
    {
        subset:request
        text:"${request}"
        icon-size:16
        icon:"icons/16/request.svg"
        layout:{
            type:VBoxLayout
            margin:10
        }
        
        HBoxLayout
        {
            "${proxy}:" LineView{name:proxy}
            "${method}:" LineView{name:method}
            "Content-Type:" LineView{name:content_type}
        }
  
        GridLayout
        {
            column:2

            "${address}:" HBoxLayout
            {
                LineEdit#stream_uri{
                    name:uri
                    readonly:true
                }
                ToolButton
                {
                    icon:"icons/16/copy.svg"
                    click:{
                        $copy(${#stream_uri})
                    }
                }
            }
            "${page_url}:" HBoxLayout
            {
                LineEdit#page_url{
                    name:page_url
                    readonly:true
                }
                ToolButton{
                    icon:"icons/16/web.svg"
                    click:$open-url(${#page_url})
                }
            }
            "User Agent:" LineEdit{
                name:user_agent
                readonly:true
            }
            "Cookies:" TextEdit{
                name:cookies
                readonly:true
            }
            "Headers:" TextEdit{
                name:headers
                readonly:true
            }
        }
    }
    {
        subset:blocks
        text:"${blocks}"
        icon-size:16
        icon:"icons/16/partials.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Blocks{
            min-height:120
            name:blocks
        }
    }
    {
        subset:connections
        text:"${connections}"
        icon-size:16
        icon:"icons/16/connect.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Table.table#connections
        {
            stretch-last-section:true
            sortable:true
            stripe:true
            editable:false
            grid:false
            numbers:true
            wordwrap:false
            selection:rows
            min-height:100
            columns:{
                {name:"transferred",width:180,text:"${transferred}",format:bytes}
                {name:"state",width:180,text:"${state}"}
                {name:"uri",width:180,text:"URI"}
            }
        }
    }
}
